@implementation POProfile

- (POProfile)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)POProfile;
  return -[POProfile init](&v3, sel_init);
}

- (POProfile)initWithProfile:(id)a3
{
  id v5;
  POProfile *v6;
  NSString *v7;
  NSString *extensionBundleIdentifier;
  NSArray *v9;
  NSArray *URLPrefix;
  NSString *v11;
  NSString *registrationToken;
  NSDictionary *v13;
  NSDictionary *extensionData;
  void *v15;
  NSString *v16;
  NSString *accountDisplayName;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  NSDictionary *v41;
  NSDictionary *tokenToUserMapping;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  uint64_t v55;
  NSArray *v56;
  NSArray *administratorGroups;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  uint64_t v67;
  NSArray *v68;
  NSArray *otherGroups;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t m;
  uint64_t v78;
  void *v79;
  char isKindOfClass;
  void *v81;
  uint64_t v82;
  NSDictionary *authorizationGroups;
  uint64_t v84;
  NSUInteger v85;
  uint64_t v86;
  unint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t n;
  void *v106;
  void *v107;
  uint64_t v108;
  NSArray *nonPlatformSSOAccounts;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  POProfile *v117;
  void *v119;
  void *v120;
  unint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  POProfile *v132;
  void *v133;
  void *v134;
  void *v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint64_t v140;
  uint64_t v141;
  id (*v142)();
  void *v143;
  void *v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
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
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  uint64_t v166;

  v166 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
    goto LABEL_79;
  v6 = -[POProfile init](self, "init");
  self = v6;
  if (!v6)
    goto LABEL_78;
  objc_storeStrong((id *)&v6->_profile, a3);
  objc_msgSend(v5, "extensionBundleIdentifier");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  self->_extensionBundleIdentifier = v7;

  objc_msgSend(v5, "URLPrefix");
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  URLPrefix = self->_URLPrefix;
  self->_URLPrefix = v9;

  objc_msgSend(v5, "pssoRegistrationToken");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  registrationToken = self->_registrationToken;
  self->_registrationToken = v11;

  objc_msgSend(v5, "extensionData");
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  extensionData = self->_extensionData;
  self->_extensionData = v13;

  objc_msgSend(v5, "platformSSO");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("AccountDisplayName"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  accountDisplayName = self->_accountDisplayName;
  self->_accountDisplayName = v16;

  objc_msgSend(v5, "platformSSO");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
  v19 = objc_claimAutoreleasedReturnValue();

  v130 = (void *)v19;
  self->_authenticationMethod = objc_msgSend(MEMORY[0x24BE04398], "authMethodWithString:", v19);
  objc_msgSend(v5, "platformSSO");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("UseSharedDeviceKeys"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v129 = v21;
  self->_useSharedDeviceKeys = objc_msgSend(v21, "BOOLValue");
  objc_msgSend(v5, "platformSSO");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("EnableCreateUserAtLogin"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v128 = v23;
  self->_createUsersEnabled = objc_msgSend(v23, "BOOLValue");
  objc_msgSend(v5, "platformSSO");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("EnableAuthorization"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v127 = v25;
  self->_authorizationEnabled = objc_msgSend(v25, "BOOLValue");
  objc_msgSend(v5, "platformSSO");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("LoginFrequency"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v27 >= &unk_24EC10B40)
        v28 = v27;
      else
        v28 = &unk_24EC10B40;
      objc_storeStrong((id *)&self->_loginFrequency, v28);
    }
  }
  v126 = v27;
  v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v5, "platformSSO");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("TokenToUserMapping"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v135 = v31;
  v133 = v5;
  v134 = v29;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v159 = 0u;
    v160 = 0u;
    v157 = 0u;
    v158 = 0u;
    objc_msgSend(v31, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v157, v165, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v158;
      v36 = *MEMORY[0x24BE72F50];
      v37 = *MEMORY[0x24BE72F58];
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v158 != v35)
            objc_enumerationMutation(v32);
          v39 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * i);
          objc_msgSend(v135, "objectForKeyedSubscript:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && ((objc_msgSend(v39, "isEqualToString:", v36) & 1) != 0
               || objc_msgSend(v39, "isEqualToString:", v37)))
            {
              objc_msgSend(v134, "setObject:forKeyedSubscript:", v40, v39);
            }
          }

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v157, v165, 16);
      }
      while (v34);
    }

    v5 = v133;
    v29 = v134;
  }
  if (objc_msgSend(v29, "count"))
  {
    v41 = (NSDictionary *)objc_msgSend(v29, "copy");
    tokenToUserMapping = self->_tokenToUserMapping;
    self->_tokenToUserMapping = v41;

  }
  objc_msgSend(v5, "platformSSO");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("NewUserAuthorizationMode"));
  v44 = objc_claimAutoreleasedReturnValue();

  v125 = (void *)v44;
  self->_newUserAuthorizationMode = objc_msgSend(MEMORY[0x24BE72E90], "userAuthorizationModeWithString:", v44);
  objc_msgSend(v5, "platformSSO");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("UserAuthorizationMode"));
  v46 = objc_claimAutoreleasedReturnValue();

  v124 = (void *)v46;
  self->_userAuthorizationMode = objc_msgSend(MEMORY[0x24BE72E90], "userAuthorizationModeWithString:", v46);
  v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "platformSSO");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("AdministratorGroups"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v50 = v49;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v153, v164, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v154;
      do
      {
        for (j = 0; j != v52; ++j)
        {
          if (*(_QWORD *)v154 != v53)
            objc_enumerationMutation(v50);
          v55 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v47, "addObject:", v55);
        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v153, v164, 16);
      }
      while (v52);
    }

    v5 = v133;
  }
  if (objc_msgSend(v47, "count"))
  {
    v56 = (NSArray *)objc_msgSend(v47, "copy");
    administratorGroups = self->_administratorGroups;
    self->_administratorGroups = v56;

  }
  v58 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

  objc_msgSend(v5, "platformSSO");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("AdditionalGroups"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = v58;
  objc_opt_class();
  v131 = v60;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    v62 = v60;
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v149, v163, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v150;
      do
      {
        for (k = 0; k != v64; ++k)
        {
          if (*(_QWORD *)v150 != v65)
            objc_enumerationMutation(v62);
          v67 = *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v61, "addObject:", v67);
        }
        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v149, v163, 16);
      }
      while (v64);
    }

  }
  v123 = v49;
  if (objc_msgSend(v61, "count"))
  {
    v68 = (NSArray *)objc_msgSend(v61, "copy");
    otherGroups = self->_otherGroups;
    self->_otherGroups = v68;

  }
  v122 = v61;
  v132 = self;
  v70 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v5, "platformSSO");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("AuthorizationGroups"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  objc_msgSend(v72, "allKeys");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v145, v162, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v146;
    do
    {
      for (m = 0; m != v75; ++m)
      {
        if (*(_QWORD *)v146 != v76)
          objc_enumerationMutation(v73);
        v78 = *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v72, "objectForKeyedSubscript:", v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v72, "objectForKeyedSubscript:", v78);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "setObject:forKeyedSubscript:", v81, v78);

          }
        }
      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v145, v162, 16);
    }
    while (v75);
  }

  self = v132;
  if (objc_msgSend(v70, "count"))
  {
    v82 = objc_msgSend(v70, "copy");
    authorizationGroups = v132->_authorizationGroups;
    v132->_authorizationGroups = (NSDictionary *)v82;

  }
  v84 = -[NSArray count](v132->_administratorGroups, "count");
  v85 = -[NSArray count](v132->_otherGroups, "count") + v84;
  v86 = -[NSDictionary count](v132->_authorizationGroups, "count");
  v87 = v85 + v86;
  v5 = v133;
  if (v85 + v86 >= 0x65)
  {
    v113 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v87);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "stringWithFormat:", CFSTR("Profile Groups: %@, Limit: %@"), v114, &unk_24EC10B58);
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    v140 = MEMORY[0x24BDAC760];
    v141 = 3221225472;
    v142 = __29__POProfile_initWithProfile___block_invoke;
    v143 = &unk_24EC025A0;
    v144 = v115;
    v112 = v115;
    v116 = __29__POProfile_initWithProfile___block_invoke();
    v111 = v115;
    v110 = v122;
  }
  else
  {
    v121 = v85 + v86;
    objc_msgSend(v133, "platformSSO");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("FileVaultPolicy"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v132->_fileVaultPolicy = -[POProfile translatePolicy:](v132, "translatePolicy:", v89);

    objc_msgSend(v133, "platformSSO");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("LoginPolicy"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v132->_loginPolicy = -[POProfile translatePolicy:](v132, "translatePolicy:", v91);

    objc_msgSend(v133, "platformSSO");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("UnlockPolicy"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v132->_unlockPolicy = -[POProfile translatePolicy:](v132, "translatePolicy:", v93);

    objc_msgSend(v133, "platformSSO");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("OfflineGracePeriod"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    v120 = v95;
    v132->_offlineGracePeriod = (int)objc_msgSend(v95, "intValue");
    objc_msgSend(v133, "platformSSO");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("AuthenticationGracePeriod"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    v119 = v97;
    v132->_requireAuthGracePeriod = (int)objc_msgSend(v97, "intValue");
    v98 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v133, "platformSSO");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("NonPlatformSSOAccounts"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v101 = v100;
    v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v136, v161, 16);
    if (v102)
    {
      v103 = v102;
      v104 = *(_QWORD *)v137;
      do
      {
        for (n = 0; n != v103; ++n)
        {
          if (*(_QWORD *)v137 != v104)
            objc_enumerationMutation(v101);
          v106 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v106, "lowercaseString");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "addObject:", v107);

          }
        }
        v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v136, v161, 16);
      }
      while (v103);
    }

    self = v132;
    if (objc_msgSend(v98, "count"))
    {
      v108 = objc_msgSend(v98, "copy");
      nonPlatformSSOAccounts = v132->_nonPlatformSSOAccounts;
      v132->_nonPlatformSSOAccounts = (NSArray *)v108;

    }
    v5 = v133;
    v87 = v121;
    v110 = v122;
    v111 = v119;
    v112 = v120;
  }

  if (v87 > 0x64)
  {
LABEL_79:
    v117 = 0;
  }
  else
  {
LABEL_78:
    self = self;
    v117 = self;
  }

  return v117;
}

id __29__POProfile_initWithProfile___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Profile rejected too many groups."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POProfile();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __29__POProfile_initWithProfile___block_invoke_cold_1();

  return v0;
}

- (unint64_t)translatePolicy:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id (*v16)();
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v3;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("AttemptAuthentication"), v13, v14, v15, v16, v17, v18, (_QWORD)v19))
          {
            v7 |= 1uLL;
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("RequireAuthentication")))
          {
            v7 |= 2uLL;
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("AllowOfflineGracePeriod")))
          {
            v7 |= 4uLL;
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("AllowAuthenticationGracePeriod")))
          {
            v7 |= 8uLL;
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("AllowTouchIDOrWatchForUnlock")))
          {
            v7 |= 0x10uLL;
          }
          else
          {
            v14 = MEMORY[0x24BDAC760];
            v15 = 3221225472;
            v16 = __29__POProfile_translatePolicy___block_invoke;
            v17 = &unk_24EC025A0;
            v18 = v10;
            v11 = __29__POProfile_translatePolicy___block_invoke();
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v3 = v13;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __29__POProfile_translatePolicy___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Invalid policy entry:"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POProfile();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __29__POProfile_initWithProfile___block_invoke_cold_1();

  return v0;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSArray)URLPrefix
{
  return self->_URLPrefix;
}

- (NSDictionary)extensionData
{
  return self->_extensionData;
}

- (NSString)registrationToken
{
  return self->_registrationToken;
}

- (int)authenticationMethod
{
  return self->_authenticationMethod;
}

- (BOOL)useSharedDeviceKeys
{
  return self->_useSharedDeviceKeys;
}

- (void)setUseSharedDeviceKeys:(BOOL)a3
{
  self->_useSharedDeviceKeys = a3;
}

- (NSString)accountDisplayName
{
  return self->_accountDisplayName;
}

- (NSNumber)loginFrequency
{
  return self->_loginFrequency;
}

- (void)setLoginFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_loginFrequency, a3);
}

- (BOOL)createUsersEnabled
{
  return self->_createUsersEnabled;
}

- (void)setCreateUsersEnabled:(BOOL)a3
{
  self->_createUsersEnabled = a3;
}

- (BOOL)authorizationEnabled
{
  return self->_authorizationEnabled;
}

- (void)setAuthorizationEnabled:(BOOL)a3
{
  self->_authorizationEnabled = a3;
}

- (NSDictionary)tokenToUserMapping
{
  return self->_tokenToUserMapping;
}

- (int64_t)newUserAuthorizationMode
{
  return self->_newUserAuthorizationMode;
}

- (int64_t)userAuthorizationMode
{
  return self->_userAuthorizationMode;
}

- (NSArray)administratorGroups
{
  return self->_administratorGroups;
}

- (NSArray)otherGroups
{
  return self->_otherGroups;
}

- (NSDictionary)authorizationGroups
{
  return self->_authorizationGroups;
}

- (unint64_t)fileVaultPolicy
{
  return self->_fileVaultPolicy;
}

- (void)setFileVaultPolicy:(unint64_t)a3
{
  self->_fileVaultPolicy = a3;
}

- (unint64_t)loginPolicy
{
  return self->_loginPolicy;
}

- (void)setLoginPolicy:(unint64_t)a3
{
  self->_loginPolicy = a3;
}

- (unint64_t)unlockPolicy
{
  return self->_unlockPolicy;
}

- (void)setUnlockPolicy:(unint64_t)a3
{
  self->_unlockPolicy = a3;
}

- (int64_t)offlineGracePeriod
{
  return self->_offlineGracePeriod;
}

- (void)setOfflineGracePeriod:(int64_t)a3
{
  self->_offlineGracePeriod = a3;
}

- (int64_t)requireAuthGracePeriod
{
  return self->_requireAuthGracePeriod;
}

- (void)setRequireAuthGracePeriod:(int64_t)a3
{
  self->_requireAuthGracePeriod = a3;
}

- (NSArray)nonPlatformSSOAccounts
{
  return self->_nonPlatformSSOAccounts;
}

- (void)setNonPlatformSSOAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (SOFullProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_nonPlatformSSOAccounts, 0);
  objc_storeStrong((id *)&self->_authorizationGroups, 0);
  objc_storeStrong((id *)&self->_otherGroups, 0);
  objc_storeStrong((id *)&self->_administratorGroups, 0);
  objc_storeStrong((id *)&self->_tokenToUserMapping, 0);
  objc_storeStrong((id *)&self->_loginFrequency, 0);
  objc_storeStrong((id *)&self->_accountDisplayName, 0);
  objc_storeStrong((id *)&self->_registrationToken, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);
  objc_storeStrong((id *)&self->_URLPrefix, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

void __29__POProfile_initWithProfile___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_2(&dword_22307D000, v0, v1, "%{public}@, %{public}@");
}

@end
