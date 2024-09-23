@implementation ICClientInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagProfileVersion, 0);
  objc_storeStrong((id *)&self->_bagProfile, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)_clientIdentifierForUserAgent
{
  return self->_clientIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)bagProfile
{
  return self->_bagProfile;
}

- (NSString)bagProfileVersion
{
  return self->_bagProfileVersion;
}

+ (ICClientInfo)defaultInfo
{
  if (defaultInfo_sOnceToken != -1)
    dispatch_once(&defaultInfo_sOnceToken, &__block_literal_global_36919);
  return (ICClientInfo *)(id)defaultInfo_sDefaultInstance;
}

- (id)_clientInfoCopyWithClass:(Class)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v4 = objc_alloc_init(a3);
  if (v4)
  {
    v5 = -[NSString copy](self->_bundleIdentifier, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

    v7 = -[NSString copy](self->_processName, "copy");
    v8 = (void *)v4[2];
    v4[2] = v7;

    v9 = -[NSString copy](self->_clientIdentifier, "copy");
    v10 = (void *)v4[3];
    v4[3] = v9;

    v11 = -[NSString copy](self->_clientVersion, "copy");
    v12 = (void *)v4[4];
    v4[4] = v11;

    v13 = -[NSString copy](self->_requestingBundleIdentifier, "copy");
    v14 = (void *)v4[5];
    v4[5] = v13;

    v15 = -[NSString copy](self->_requestingBundleVersion, "copy");
    v16 = (void *)v4[6];
    v4[6] = v15;

    v17 = -[NSString copy](self->_bagProfile, "copy");
    v18 = (void *)v4[7];
    v4[7] = v17;

    v19 = -[NSString copy](self->_bagProfileVersion, "copy");
    v20 = (void *)v4[8];
    v4[8] = v19;

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_processName, CFSTR("processName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientIdentifier, CFSTR("clientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientVersion, CFSTR("clientVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestingBundleIdentifier, CFSTR("requestingBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestingBundleVersion, CFSTR("requestingBundleVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bagProfile, CFSTR("bagProfile"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bagProfileVersion, CFSTR("bagProfileVersion"));

}

- (NSString)requestingBundleIdentifier
{
  return self->_requestingBundleIdentifier;
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (ICClientInfo)initWithCoder:(id)a3
{
  id v4;
  ICClientInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  uint64_t v10;
  NSString *processName;
  void *v12;
  uint64_t v13;
  NSString *clientIdentifier;
  void *v15;
  uint64_t v16;
  NSString *clientVersion;
  void *v18;
  uint64_t v19;
  NSString *requestingBundleIdentifier;
  void *v21;
  uint64_t v22;
  NSString *requestingBundleVersion;
  void *v24;
  uint64_t v25;
  NSString *bagProfile;
  void *v27;
  uint64_t v28;
  NSString *bagProfileVersion;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ICClientInfo;
  v5 = -[ICClientInfo init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    processName = v5->_processName;
    v5->_processName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientVersion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    clientVersion = v5->_clientVersion;
    v5->_clientVersion = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestingBundleIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    requestingBundleIdentifier = v5->_requestingBundleIdentifier;
    v5->_requestingBundleIdentifier = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestingBundleVersion"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    requestingBundleVersion = v5->_requestingBundleVersion;
    v5->_requestingBundleVersion = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bagProfile"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    bagProfile = v5->_bagProfile;
    v5->_bagProfile = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bagProfileVersion"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    bagProfileVersion = v5->_bagProfileVersion;
    v5->_bagProfileVersion = (NSString *)v28;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)clientInfoForMusicKitRequestWithClientIdentifier:(id)a3 clientVersion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:bundleIdentifier:", v7, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __27__ICClientInfo_defaultInfo__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  ICMutableClientInfo *v10;
  uint64_t v11;
  void *v12;
  ICMutableClientInfo *v13;

  v13 = objc_alloc_init(ICMutableClientInfo);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICMutableClientInfo setProcessName:](v13, "setProcessName:", v1);
  -[ICMutableClientInfo setClientIdentifier:](v13, "setClientIdentifier:", v1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAF0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    goto LABEL_4;
  objc_msgSend(v2, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString length](v6, "length"))
  {
    v4 = v6;
LABEL_4:
    v6 = v4;
    v7 = v6;
    goto LABEL_5;
  }
  v7 = CFSTR("1.0");
LABEL_5:
  objc_msgSend(v2, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  v10 = v13;
  if (v9)
  {
    -[ICMutableClientInfo setBundleIdentifier:](v13, "setBundleIdentifier:", v8);
    v10 = v13;
  }
  -[ICMutableClientInfo setClientVersion:](v10, "setClientVersion:", v7);
  -[ICClientInfo _setDefaultBagProfileForClientIdentifier:](v13, "_setDefaultBagProfileForClientIdentifier:", v1);
  v11 = -[ICMutableClientInfo copy](v13, "copy");
  v12 = (void *)defaultInfo_sDefaultInstance;
  defaultInfo_sDefaultInstance = v11;

}

+ (id)clientInfoForMusicKitRequestWithClientIdentifier:(id)a3 clientVersion:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICMutableClientInfo *v11;
  void *v12;
  void *v13;
  ICMutableClientInfo *v14;
  ICMutableClientInfo *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[ICClientInfo initWithBundleIdentifier:]([ICMutableClientInfo alloc], "initWithBundleIdentifier:", v8);

  -[ICClientInfo bundleIdentifier](v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableClientInfo setRequestingBundleIdentifier:](v11, "setRequestingBundleIdentifier:", v12);

  -[ICClientInfo clientVersion](v11, "clientVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableClientInfo setRequestingBundleVersion:](v11, "setRequestingBundleVersion:", v13);

  -[ICMutableClientInfo setClientIdentifier:](v11, "setClientIdentifier:", v10);
  -[ICMutableClientInfo setClientVersion:](v11, "setClientVersion:", v9);

  -[ICMutableClientInfo setBagProfile:](v11, "setBagProfile:", CFSTR("itunescloudd"));
  -[ICMutableClientInfo setBagProfileVersion:](v11, "setBagProfileVersion:", CFSTR("1"));
  if ((id)objc_opt_class() == a1)
    v14 = (ICMutableClientInfo *)-[ICMutableClientInfo copy](v11, "copy");
  else
    v14 = v11;
  v15 = v14;

  return v15;
}

- (ICClientInfo)initWithBundleIdentifier:(id)a3
{
  id v5;
  ICClientInfo *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSString *processName;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSString *v20;
  NSString *clientVersion;
  id v23;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ICClientInfo;
  v6 = -[ICClientInfo init](&v24, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v5, 0, &v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v23;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || v10)
    {
      ICKnownProcessNameForSystemApplication(v5);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      ICKnownClientVersionForSystemApplication(v5);
      v19 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v19;
      if (v11 && v19)
      {
        objc_storeStrong((id *)&v6->_processName, v11);
        objc_storeStrong((id *)&v6->_clientIdentifier, v6->_processName);
        v20 = v18;
        clientVersion = v6->_clientVersion;
        v6->_clientVersion = v20;
      }
      else
      {
        objc_storeStrong((id *)&v6->_clientIdentifier, a3);
        objc_storeStrong((id *)&v6->_processName, a3);
        clientVersion = v6->_clientVersion;
        v6->_clientVersion = (NSString *)CFSTR("1.0");
      }

    }
    else
    {
      v11 = v9;
      objc_msgSend(v11, "executableURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = objc_claimAutoreleasedReturnValue();
      processName = v6->_processName;
      v6->_processName = (NSString *)v13;

      objc_storeStrong((id *)&v6->_clientIdentifier, v6->_processName);
      objc_msgSend(v11, "shortVersionString");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v6->_clientVersion;
      v6->_clientVersion = (NSString *)v15;

      if (-[NSString length](v6->_clientVersion, "length"))
      {
LABEL_12:

        -[ICClientInfo _setDefaultBagProfileForClientIdentifier:](v6, "_setDefaultBagProfileForClientIdentifier:", v6->_clientIdentifier);
        goto LABEL_13;
      }
      objc_msgSend(v11, "bundleVersion");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v6->_clientVersion;
      v6->_clientVersion = (NSString *)v17;
    }

    goto LABEL_12;
  }
LABEL_13:

  return v6;
}

- (void)_setDefaultBagProfileForClientIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *bagProfile;
  NSString *v7;
  NSObject *v8;
  NSString *clientIdentifier;
  NSString *v10;
  NSString *v11;
  NSString *bagProfileVersion;
  int v13;
  NSString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_setDefaultBagProfileForClientIdentifier__sDefaultBagProfilesOnceToken != -1)
    dispatch_once(&_setDefaultBagProfileForClientIdentifier__sDefaultBagProfilesOnceToken, &__block_literal_global_31);
  objc_msgSend((id)_setDefaultBagProfileForClientIdentifier__sDefaultBagProfileNames, "objectForKey:", self->_clientIdentifier);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  bagProfile = self->_bagProfile;
  self->_bagProfile = v5;

  v7 = self->_bagProfile;
  if (!v7)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      clientIdentifier = self->_clientIdentifier;
      v13 = 138543618;
      v14 = clientIdentifier;
      v15 = 2114;
      v16 = CFSTR("itunescloudd");
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "No default bag profile for client '%{public}@' - using default '%{public}@'", (uint8_t *)&v13, 0x16u);
    }

    v10 = self->_bagProfile;
    self->_bagProfile = (NSString *)CFSTR("itunescloudd");

    v7 = self->_bagProfile;
  }
  objc_msgSend((id)_setDefaultBagProfileForClientIdentifier__sDefaultBagProfileVersions, "objectForKey:", v7);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  bagProfileVersion = self->_bagProfileVersion;
  self->_bagProfileVersion = v11;

  if (!self->_bagProfileVersion)
    self->_bagProfileVersion = (NSString *)CFSTR("1");

}

- (ICClientInfo)initWithSystemApplicationType:(int64_t)a3
{
  void *v4;
  ICClientInfo *v5;

  ICBundleIdentifierForSystemApplicationType(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICClientInfo initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v4);

  return v5;
}

- (NSString)processName
{
  return self->_processName;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  -[ICClientInfo _clientInfoCopyWithClass:](self, "_clientInfoCopyWithClass:", objc_opt_class());
  return (id)objc_claimAutoreleasedReturnValue();
}

void __57__ICClientInfo__setDefaultBagProfileForClientIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", &unk_1E43E6F80);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_setDefaultBagProfileForClientIdentifier__sDefaultBagProfileNames;
  _setDefaultBagProfileForClientIdentifier__sDefaultBagProfileNames = v0;

  v2 = (void *)_setDefaultBagProfileForClientIdentifier__sDefaultBagProfileVersions;
  _setDefaultBagProfileForClientIdentifier__sDefaultBagProfileVersions = (uint64_t)&unk_1E43E6FA8;

}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  if (self->_bundleIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR("; bundleIdentifier = \"%@\"), self->_bundleIdentifier);
  if (self->_processName)
    objc_msgSend(v6, "appendFormat:", CFSTR("; processName = \"%@\"), self->_processName);
  if (self->_clientIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR("; clientIdentifier = \"%@\"), self->_clientIdentifier);
  if (self->_clientVersion)
    objc_msgSend(v6, "appendFormat:", CFSTR("; clientVersion = \"%@\"), self->_clientVersion);
  if (self->_requestingBundleIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR("; requestingBundleIdentifier = \"%@\"), self->_requestingBundleIdentifier);
  if (self->_requestingBundleVersion)
    objc_msgSend(v6, "appendFormat:", CFSTR("; requestingBundleVersion = \"%@\"), self->_requestingBundleVersion);
  if (self->_bagProfile)
    objc_msgSend(v6, "appendFormat:", CFSTR("; bagProfile = \"%@\"), self->_bagProfile);
  if (self->_bagProfileVersion)
    objc_msgSend(v6, "appendFormat:", CFSTR("; bagProfileVersion = \"%@\"), self->_bagProfileVersion);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSString *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSString *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSString *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSString *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSString *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v128 = __ROR8__(v14 + v13, 32);
  v137 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v119 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_bundleIdentifier;
  v19 = -[NSString hash](v18, "hash");
  v20 = (v17 + v119) ^ __ROR8__(v119, 51);
  v21 = v128 + (v137 ^ v19);
  v22 = __ROR8__(v137 ^ v19, 48);
  v23 = (v21 ^ v22) + __ROR8__(v17 + v119, 32);
  v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  v25 = v21 + v20;
  v129 = __ROR8__(v25, 32);
  v138 = v24;
  v111 = v23 ^ v19;
  v120 = v25 ^ __ROR8__(v20, 47);

  v26 = self->_processName;
  v27 = -[NSString hash](v26, "hash");
  v28 = (v111 + v120) ^ __ROR8__(v120, 51);
  v29 = v129 + (v138 ^ v27);
  v30 = __ROR8__(v138 ^ v27, 48);
  v31 = (v29 ^ v30) + __ROR8__(v111 + v120, 32);
  v32 = v31 ^ __ROR8__(v29 ^ v30, 43);
  v33 = v29 + v28;
  v130 = __ROR8__(v33, 32);
  v139 = v32;
  v112 = v31 ^ v27;
  v121 = v33 ^ __ROR8__(v28, 47);

  v34 = self->_clientIdentifier;
  v35 = -[NSString hash](v34, "hash");
  v36 = (v112 + v121) ^ __ROR8__(v121, 51);
  v37 = v130 + (v139 ^ v35);
  v38 = __ROR8__(v139 ^ v35, 48);
  v39 = (v37 ^ v38) + __ROR8__(v112 + v121, 32);
  v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
  v41 = v37 + v36;
  v131 = __ROR8__(v41, 32);
  v140 = v40;
  v113 = v39 ^ v35;
  v122 = v41 ^ __ROR8__(v36, 47);

  v42 = self->_clientVersion;
  v43 = -[NSString hash](v42, "hash");
  v44 = (v113 + v122) ^ __ROR8__(v122, 51);
  v45 = v131 + (v140 ^ v43);
  v46 = __ROR8__(v140 ^ v43, 48);
  v47 = (v45 ^ v46) + __ROR8__(v113 + v122, 32);
  v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
  v49 = v45 + v44;
  v132 = __ROR8__(v49, 32);
  v141 = v48;
  v114 = v47 ^ v43;
  v123 = v49 ^ __ROR8__(v44, 47);

  v50 = self->_requestingBundleIdentifier;
  v51 = -[NSString hash](v50, "hash");
  v52 = (v114 + v123) ^ __ROR8__(v123, 51);
  v53 = v132 + (v141 ^ v51);
  v54 = __ROR8__(v141 ^ v51, 48);
  v55 = (v53 ^ v54) + __ROR8__(v114 + v123, 32);
  v56 = v55 ^ __ROR8__(v53 ^ v54, 43);
  v57 = v53 + v52;
  v133 = __ROR8__(v57, 32);
  v142 = v56;
  v115 = v55 ^ v51;
  v124 = v57 ^ __ROR8__(v52, 47);

  v58 = self->_requestingBundleVersion;
  v59 = -[NSString hash](v58, "hash");
  v60 = (v115 + v124) ^ __ROR8__(v124, 51);
  v61 = v133 + (v142 ^ v59);
  v62 = __ROR8__(v142 ^ v59, 48);
  v63 = (v61 ^ v62) + __ROR8__(v115 + v124, 32);
  v64 = v63 ^ __ROR8__(v61 ^ v62, 43);
  v65 = v61 + v60;
  v134 = __ROR8__(v65, 32);
  v143 = v64;
  v116 = v63 ^ v59;
  v125 = v65 ^ __ROR8__(v60, 47);

  v66 = self->_bagProfile;
  v67 = -[NSString hash](v66, "hash");
  v68 = (v116 + v125) ^ __ROR8__(v125, 51);
  v69 = v134 + (v143 ^ v67);
  v70 = __ROR8__(v143 ^ v67, 48);
  v71 = (v69 ^ v70) + __ROR8__(v116 + v125, 32);
  v72 = v71 ^ __ROR8__(v69 ^ v70, 43);
  v73 = v69 + v68;
  v135 = __ROR8__(v73, 32);
  v144 = v72;
  v117 = v71 ^ v67;
  v126 = v73 ^ __ROR8__(v68, 47);

  v74 = self->_bagProfileVersion;
  v75 = -[NSString hash](v74, "hash");
  v76 = (v117 + v126) ^ __ROR8__(v126, 51);
  v77 = v135 + (v144 ^ v75);
  v78 = __ROR8__(v144 ^ v75, 48);
  v79 = (v77 ^ v78) + __ROR8__(v117 + v126, 32);
  v80 = v79 ^ __ROR8__(v77 ^ v78, 43);
  v81 = v77 + v76;
  v136 = __ROR8__(v81, 32);
  v145 = v80;
  v118 = v79 ^ v75;
  v127 = v81 ^ __ROR8__(v76, 47);

  v82 = (v118 + v127) ^ __ROR8__(v127, 51);
  v83 = v136 + (v145 ^ 0x4800000000000000);
  v84 = __ROR8__(v145 ^ 0x4800000000000000, 48);
  v85 = (v83 ^ v84) + __ROR8__(v118 + v127, 32);
  v86 = v85 ^ __ROR8__(v83 ^ v84, 43);
  v87 = v83 + v82;
  v88 = v87 ^ __ROR8__(v82, 47);
  v89 = (v85 ^ 0x4800000000000000) + v88;
  v90 = v89 ^ __ROR8__(v88, 51);
  v91 = (__ROR8__(v87, 32) ^ 0xFFLL) + v86;
  v92 = __ROR8__(v86, 48);
  v93 = __ROR8__(v89, 32) + (v91 ^ v92);
  v94 = v93 ^ __ROR8__(v91 ^ v92, 43);
  v95 = v90 + v91;
  v96 = v95 ^ __ROR8__(v90, 47);
  v97 = v96 + v93;
  v98 = v97 ^ __ROR8__(v96, 51);
  v99 = __ROR8__(v95, 32) + v94;
  v100 = __ROR8__(v94, 48);
  v101 = __ROR8__(v97, 32) + (v99 ^ v100);
  v102 = v101 ^ __ROR8__(v99 ^ v100, 43);
  v103 = v98 + v99;
  v104 = v103 ^ __ROR8__(v98, 47);
  v105 = v104 + v101;
  v106 = v105 ^ __ROR8__(v104, 51);
  v107 = __ROR8__(v103, 32) + v102;
  v108 = __ROR8__(v102, 48);
  v109 = __ROR8__(v105, 32) + (v107 ^ v108);
  return (v106 + v107) ^ __ROR8__(v106, 47) ^ v109 ^ __ROR8__(v106 + v107, 32) ^ v109 ^ __ROR8__(v107 ^ v108, 43);
}

+ (id)_clientInfoForCloudDaemonOriginatedMusicKitRequestWithRequestingBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:bundleIdentifier:", CFSTR("itunescloudd"), CFSTR("1"), a3);
}

- (BOOL)isEqual:(id)a3
{
  ICClientInfo *v4;
  ICClientInfo *v5;
  NSString *bundleIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  char v11;
  NSString *processName;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  int v16;
  NSString *clientIdentifier;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  int v21;
  NSString *clientVersion;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  int v26;
  NSString *requestingBundleIdentifier;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  int v31;
  NSString *requestingBundleVersion;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  int v36;
  NSString *bagProfile;
  NSString *v38;
  NSString *v39;
  NSString *v40;
  int v41;
  NSString *bagProfileVersion;
  NSString *v44;
  NSString *v45;
  NSString *v46;

  v4 = (ICClientInfo *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[ICClientInfo isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      bundleIdentifier = self->_bundleIdentifier;
      v7 = v5->_bundleIdentifier;
      if (bundleIdentifier == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = bundleIdentifier;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_31;
      }
      processName = self->_processName;
      v13 = v5->_processName;
      if (processName == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = processName;
        v16 = -[NSString isEqual:](v15, "isEqual:", v14);

        if (!v16)
          goto LABEL_31;
      }
      clientIdentifier = self->_clientIdentifier;
      v18 = v5->_clientIdentifier;
      if (clientIdentifier == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = clientIdentifier;
        v21 = -[NSString isEqual:](v20, "isEqual:", v19);

        if (!v21)
          goto LABEL_31;
      }
      clientVersion = self->_clientVersion;
      v23 = v5->_clientVersion;
      if (clientVersion == v23)
      {

      }
      else
      {
        v24 = v23;
        v25 = clientVersion;
        v26 = -[NSString isEqual:](v25, "isEqual:", v24);

        if (!v26)
          goto LABEL_31;
      }
      requestingBundleIdentifier = self->_requestingBundleIdentifier;
      v28 = v5->_requestingBundleIdentifier;
      if (requestingBundleIdentifier == v28)
      {

      }
      else
      {
        v29 = v28;
        v30 = requestingBundleIdentifier;
        v31 = -[NSString isEqual:](v30, "isEqual:", v29);

        if (!v31)
          goto LABEL_31;
      }
      requestingBundleVersion = self->_requestingBundleVersion;
      v33 = v5->_requestingBundleVersion;
      if (requestingBundleVersion == v33)
      {

      }
      else
      {
        v34 = v33;
        v35 = requestingBundleVersion;
        v36 = -[NSString isEqual:](v35, "isEqual:", v34);

        if (!v36)
          goto LABEL_31;
      }
      bagProfile = self->_bagProfile;
      v38 = v5->_bagProfile;
      if (bagProfile == v38)
      {

      }
      else
      {
        v39 = v38;
        v40 = bagProfile;
        v41 = -[NSString isEqual:](v40, "isEqual:", v39);

        if (!v41)
        {
LABEL_31:
          v11 = 0;
LABEL_32:

          goto LABEL_33;
        }
      }
      bagProfileVersion = self->_bagProfileVersion;
      v44 = v5->_bagProfileVersion;
      v45 = bagProfileVersion;
      v46 = v45;
      if (v45 == v44)
        v11 = 1;
      else
        v11 = -[NSString isEqual:](v45, "isEqual:", v44);

      goto LABEL_32;
    }
    v11 = 0;
  }
LABEL_33:

  return v11;
}

- (NSString)clientBundleIdentifier
{
  NSString *requestingBundleIdentifier;
  NSString *v3;
  void *v5;

  requestingBundleIdentifier = self->_requestingBundleIdentifier;
  if (requestingBundleIdentifier || (requestingBundleIdentifier = self->_bundleIdentifier) != 0)
  {
    v3 = requestingBundleIdentifier;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
