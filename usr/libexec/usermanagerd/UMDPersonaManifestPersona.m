@implementation UMDPersonaManifestPersona

- (UMDPersonaManifestPersona)init
{
  UMDPersonaManifestPersona *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UMDPersonaManifestPersona;
  result = -[UMDPersonaManifestPersona init](&v3, "init");
  if (!result)
    sub_1000ACF54();
  result->_type = 1000;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  UMDPersonaManifestPersona *v5;
  uint64_t v6;
  UMDPersonaManifestPersona *v7;
  UMDPersonaManifestPersona *v8;
  unsigned int type;
  unsigned int v10;
  NSUUID *v11;
  NSUUID *v12;
  unsigned __int8 v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  NSUUID *v21;
  NSUUID *uuid;
  unsigned int kernelID;
  unsigned int v24;
  NSString *v25;
  NSString *v26;
  UMDPersonaManifestPersona *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  NSString *v35;
  NSString *nickname;
  NSSet *v37;
  int v38;
  NSSet **p_bundleIDs;
  NSSet *v40;
  NSSet *v41;
  NSSet *bundleIDs;
  NSSet *v43;
  int v44;
  NSSet **p_observers;
  NSSet *v46;
  NSSet *observers;
  _BOOL4 isDeleting;
  id *p_isa;
  NSString *v50;
  NSString *v51;
  NSString *v52;
  NSString *v53;
  NSString *displayName;
  NSDate *v55;
  NSDate *v56;
  NSDate *v57;
  NSDate *v58;
  NSDate *createTime;
  NSDate *v60;
  NSDate *v61;
  NSDate *v62;
  NSDate *loginTime;
  NSUUID *v64;
  NSUUID *v65;
  NSUUID *v66;
  NSUUID *volumeUUID;
  NSUUID *v68;
  NSUUID *v69;
  NSUUID *v70;
  NSUUID *homeUUID;
  NSString *v72;
  NSString *homeDir;
  UMDPersonaManifestPersona *deviceNode;
  void *userUUID;
  unsigned int uid;
  unsigned int v77;
  unsigned int gid;
  unsigned int v79;
  void *encryptedVolumeKey;
  int v81;
  NSData *v82;
  NSData *v83;
  NSData *v84;
  NSUUID *v85;
  id v86;
  NSString *v87;
  NSUUID *v88;
  UMDPersonaManifestPersona *v89;
  NSString *v90;
  NSUUID *v91;
  NSString *v92;
  NSString *v93;
  NSUUID *v94;
  NSString *v95;
  NSString *v96;
  NSUUID *v97;
  NSUUID *v98;
  NSString *v99;
  NSUUID *v100;
  NSDate *v101;
  NSUUID *v102;
  NSUUID *v103;
  NSUUID *v104;
  NSDate *v105;
  NSUUID *v106;
  NSDate *v107;
  NSDate *v108;
  NSDate *v109;
  NSString *v110;
  NSDate *v111;
  NSString *v112;
  NSSet *v113;
  NSSet *v114;
  NSSet *v115;
  NSSet *v116;
  NSString *v117;
  NSSet *v118;
  NSSet *v119;
  NSSet *v120;
  NSString *v121;
  NSSet *v122;
  NSString *v123;
  NSUUID *v124;
  NSString *v125;
  NSUUID *v126;
  NSUUID *v127;
  NSDate *v128;
  NSString *v129;
  NSDate *v130;
  NSString *v131;
  NSUUID *v132;
  int v133;
  _BYTE v134[20];
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
  uint64_t v146;
  unsigned int v147;
  unsigned int v148;
  int v149;

  v5 = (UMDPersonaManifestPersona *)a3;
  if (self == v5)
  {
    v13 = 1;
    goto LABEL_107;
  }
  v6 = objc_opt_class(UMDPersonaManifestPersona);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v13 = 0;
    goto LABEL_107;
  }
  v7 = v5;
  v8 = v7;
  if (self)
  {
    type = self->_type;
    if (v7)
    {
LABEL_5:
      v10 = v7->_type;
      goto LABEL_6;
    }
  }
  else
  {
    type = 0;
    if (v7)
      goto LABEL_5;
  }
  v10 = 0;
LABEL_6:
  v147 = v10;
  v148 = type;
  if (type != v10)
  {
    v146 = 0;
    v149 = 0;
    v145 = 0;
    v144 = 0;
    memset(v134, 0, sizeof(v134));
    v143 = 0;
    v142 = 0;
    v141 = 0;
    v14 = 0;
    v140 = 0;
    v15 = 0;
    v139 = 0;
    v138 = 0;
    v133 = 0;
    v137 = 0;
    v16 = 0;
    v136 = 0;
    v17 = 0;
    v135 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    goto LABEL_30;
  }
  if (!self || (v11 = self->_uuid) == 0)
  {
    if (!v8 || (v21 = v8->_uuid) == 0)
    {
      v127 = 0;
      v124 = 0;
      v146 = 0x100000000;
      if (self)
        goto LABEL_22;
LABEL_112:
      kernelID = 0;
      if (v8)
        goto LABEL_23;
      goto LABEL_113;
    }
    v124 = v21;
    if (self)
      v12 = self->_uuid;
    else
      v12 = 0;
    v127 = 0;
    HIDWORD(v146) = 1;
    goto LABEL_19;
  }
  v127 = v11;
  v12 = self->_uuid;
  HIDWORD(v146) = 0;
  if (v8)
  {
LABEL_19:
    v132 = v12;
    uuid = v8->_uuid;
    goto LABEL_20;
  }
  v132 = v12;
  uuid = 0;
LABEL_20:
  v126 = uuid;
  LODWORD(v146) = 1;
  if (!-[NSUUID isEqual:](v132, "isEqual:"))
  {
LABEL_29:
    v149 = 0;
    v145 = 0;
    v144 = 0;
    memset(v134, 0, sizeof(v134));
    v143 = 0;
    v142 = 0;
    v141 = 0;
    v14 = 0;
    v140 = 0;
    v15 = 0;
    v139 = 0;
    v138 = 0;
    v133 = 0;
    v137 = 0;
    v16 = 0;
    v136 = 0;
    v17 = 0;
    v135 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    goto LABEL_30;
  }
  if (!self)
    goto LABEL_112;
LABEL_22:
  kernelID = self->_kernelID;
  if (v8)
  {
LABEL_23:
    v24 = v8->_kernelID;
    goto LABEL_24;
  }
LABEL_113:
  v24 = 0;
LABEL_24:
  if (kernelID != v24)
    goto LABEL_29;
  if (!self)
  {
    p_isa = (id *)&v8->super.isa;
    if (!v8)
    {
      v38 = 0;
      v117 = 0;
      v123 = 0;
      v44 = 0;
      v114 = 0;
      v120 = 0;
      LODWORD(v143) = 0;
      v113 = 0;
      v116 = 0;
      HIDWORD(v145) = 1;
      goto LABEL_211;
    }
    v123 = 0;
    HIDWORD(v145) = 1;
    v117 = v8->_nickname;
    if (!v117)
    {
      v38 = 0;
      v117 = 0;
      goto LABEL_172;
    }
    v26 = 0;
    goto LABEL_117;
  }
  v25 = self->_nickname;
  if (!v25)
  {
    if (!v8)
    {
      v120 = self->_bundleIDs;
      if (v120)
      {
        v122 = self->_bundleIDs;
        v123 = 0;
        v38 = 0;
        v117 = 0;
        HIDWORD(v144) = 0;
        bundleIDs = 0;
        HIDWORD(v145) = 1;
        goto LABEL_133;
      }
      v38 = 0;
      v117 = 0;
      v123 = 0;
      HIDWORD(v145) = 1;
LABEL_183:
      v116 = self->_observers;
      if (v116)
      {
        v119 = self->_observers;
        v120 = 0;
        v44 = 0;
        v114 = 0;
        HIDWORD(v143) = 0;
        observers = 0;
        HIDWORD(v144) = 1;
        goto LABEL_148;
      }
      v44 = 0;
      v114 = 0;
      v120 = 0;
      HIDWORD(v144) = 1;
LABEL_191:
      LODWORD(v145) = v38;
      v143 = 0x100000000;
      LODWORD(v144) = v44;
      v116 = 0;
      v113 = 0;
      if (self->_isDeleting)
      {
        v149 = 1;
        *(_DWORD *)&v134[16] = 1;
        *(_QWORD *)v134 = 1;
        v113 = 0;
        v13 = 0;
        *(_QWORD *)&v134[8] = 0;
        v142 = 0;
        v141 = 0;
        v14 = 0;
        v140 = 0;
        v15 = 0;
        v139 = 0;
        v138 = 0;
        v133 = 0;
        v137 = 0;
        v16 = 0;
        v136 = 0;
        v17 = 0;
        v135 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        goto LABEL_30;
      }
      goto LABEL_193;
    }
    v35 = v8->_nickname;
    if (!v35)
    {
      p_bundleIDs = &self->_bundleIDs;
      v40 = self->_bundleIDs;
      v38 = 0;
      v117 = 0;
      if (v40)
      {
        v120 = v40;
        HIDWORD(v145) = 1;
        v123 = 0;
        HIDWORD(v144) = 0;
LABEL_131:
        v122 = *p_bundleIDs;
LABEL_132:
        bundleIDs = v8->_bundleIDs;
        goto LABEL_133;
      }
      HIDWORD(v145) = 1;
      v123 = 0;
LABEL_129:
      v41 = v8->_bundleIDs;
      if (!v41)
      {
        p_observers = &self->_observers;
        v44 = 0;
        HIDWORD(v144) = 1;
        v116 = self->_observers;
        v114 = 0;
        if (v116)
        {
          v120 = 0;
          HIDWORD(v143) = 0;
LABEL_146:
          v119 = *p_observers;
LABEL_147:
          observers = v8->_observers;
          goto LABEL_148;
        }
        v120 = 0;
LABEL_144:
        v46 = v8->_observers;
        if (!v46)
        {
          v116 = 0;
          v113 = 0;
          isDeleting = self->_isDeleting;
          v143 = 0x100000000;
          goto LABEL_155;
        }
        v113 = v46;
        v116 = 0;
        p_observers = &self->_observers;
        HIDWORD(v143) = 1;
        goto LABEL_146;
      }
      v114 = v41;
      v120 = 0;
      p_bundleIDs = &self->_bundleIDs;
      HIDWORD(v144) = 1;
      goto LABEL_131;
    }
    v117 = v35;
    v26 = self->_nickname;
    v123 = 0;
    HIDWORD(v145) = 1;
    goto LABEL_117;
  }
  v123 = v25;
  v26 = self->_nickname;
  HIDWORD(v145) = 0;
  if (v8)
  {
LABEL_117:
    v125 = v26;
    nickname = v8->_nickname;
    goto LABEL_118;
  }
  v125 = v26;
  nickname = 0;
LABEL_118:
  v121 = nickname;
  if (!-[NSString isEqual:](v125, "isEqual:"))
  {
    v144 = 0;
    memset(v134, 0, sizeof(v134));
    v143 = 0;
    v142 = 0;
    v141 = 0;
    v14 = 0;
    v140 = 0;
    v15 = 0;
    v139 = 0;
    v138 = 0;
    v133 = 0;
    v137 = 0;
    v16 = 0;
    v136 = 0;
    v17 = 0;
    v135 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    v149 = 1;
    LODWORD(v145) = 1;
    goto LABEL_30;
  }
  if (!self)
  {
    v38 = 1;
    p_isa = (id *)&v8->super.isa;
    if (!v8)
    {
      v44 = 0;
      v114 = 0;
      v120 = 0;
      LODWORD(v143) = 0;
      v113 = 0;
      v116 = 0;
LABEL_211:
      HIDWORD(v144) = 1;
      goto LABEL_212;
    }
LABEL_172:
    v120 = 0;
    HIDWORD(v144) = 1;
    v114 = (NSSet *)p_isa[6];
    if (!v114)
    {
      v44 = 0;
      v114 = 0;
LABEL_177:
      v116 = 0;
      HIDWORD(v143) = 1;
      v113 = (NSSet *)p_isa[7];
      if (!v113)
      {
        LODWORD(v143) = 0;
        v113 = 0;
        v8 = (UMDPersonaManifestPersona *)p_isa;
LABEL_186:
        LODWORD(v144) = v44;
        LODWORD(v145) = v38;
        if (v8->_isDeleting || v8->_isDisabled)
          goto LABEL_158;
LABEL_198:
        if (v8)
        {
          v53 = v8->_displayName;
          if (v53)
          {
            v129 = v53;
            if (self)
              v51 = self->_displayName;
            else
              v51 = 0;
            v52 = 0;
            HIDWORD(v142) = 1;
            goto LABEL_203;
          }
        }
LABEL_213:
        v131 = 0;
        v129 = 0;
        v142 = 0x100000000;
        goto LABEL_214;
      }
      v119 = 0;
      v8 = (UMDPersonaManifestPersona *)p_isa;
      goto LABEL_147;
    }
    v122 = 0;
    v8 = (UMDPersonaManifestPersona *)p_isa;
    goto LABEL_132;
  }
  v37 = self->_bundleIDs;
  if (!v37)
  {
    v38 = 1;
    if (!v8)
      goto LABEL_183;
    goto LABEL_129;
  }
  v120 = v37;
  HIDWORD(v144) = 0;
  v38 = 1;
  v122 = self->_bundleIDs;
  if (v8)
    goto LABEL_132;
  bundleIDs = 0;
LABEL_133:
  v118 = bundleIDs;
  if (!-[NSSet isEqual:](v122, "isEqual:", v118))
  {
    LODWORD(v145) = v38;
    *(_QWORD *)v134 = 0;
    *(_QWORD *)&v134[8] = 0;
    v143 = 0;
    v142 = 0;
    v141 = 0;
    v14 = 0;
    v140 = 0;
    v15 = 0;
    v139 = 0;
    v138 = 0;
    v133 = 0;
    v137 = 0;
    v16 = 0;
    v136 = 0;
    v17 = 0;
    v135 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    v149 = 1;
    *(_DWORD *)&v134[16] = 1;
    LODWORD(v144) = 1;
    goto LABEL_30;
  }
  if (!self)
  {
    v44 = 1;
    p_isa = (id *)&v8->super.isa;
    if (v8)
      goto LABEL_177;
    LODWORD(v143) = 0;
    v113 = 0;
    v116 = 0;
LABEL_212:
    HIDWORD(v143) = 1;
    v8 = 0;
    goto LABEL_213;
  }
  v43 = self->_observers;
  if (!v43)
  {
    v44 = 1;
    if (!v8)
      goto LABEL_191;
    goto LABEL_144;
  }
  v116 = v43;
  HIDWORD(v143) = 0;
  v44 = 1;
  v119 = self->_observers;
  if (v8)
    goto LABEL_147;
  observers = 0;
LABEL_148:
  v115 = observers;
  if (!-[NSSet isEqual:](v119, "isEqual:"))
  {
    LODWORD(v144) = v44;
    LODWORD(v145) = v38;
    *(_QWORD *)&v134[8] = 0;
    v142 = 0;
    v141 = 0;
    v14 = 0;
    v140 = 0;
    v15 = 0;
    v139 = 0;
    *(_DWORD *)&v134[4] = 0;
    v138 = 0;
    v133 = 0;
    v137 = 0;
    v16 = 0;
    v136 = 0;
    v17 = 0;
    v135 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    v149 = 1;
LABEL_153:
    *(_DWORD *)&v134[16] = 1;
    *(_DWORD *)v134 = 1;
    LODWORD(v143) = 1;
    goto LABEL_30;
  }
  if (!self)
  {
    LODWORD(v143) = 1;
    if (!v8)
      goto LABEL_198;
    goto LABEL_186;
  }
  isDeleting = self->_isDeleting;
  if (!v8)
  {
    LODWORD(v144) = v44;
    LODWORD(v145) = v38;
    v149 = 1;
    if (self->_isDeleting)
    {
      *(_QWORD *)&v134[8] = 0;
      v142 = 0;
      v141 = 0;
      v14 = 0;
      v140 = 0;
      v15 = 0;
      v139 = 0;
      *(_DWORD *)&v134[4] = 0;
      v138 = 0;
      v133 = 0;
      v137 = 0;
      v16 = 0;
      v136 = 0;
      v17 = 0;
      v135 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v13 = 0;
      goto LABEL_153;
    }
    LODWORD(v143) = 1;
LABEL_193:
    if (self->_isDisabled)
      goto LABEL_158;
    v38 = v145;
    v44 = v144;
    goto LABEL_195;
  }
  LODWORD(v143) = 1;
LABEL_155:
  if (((isDeleting ^ v8->_isDeleting) & 1) != 0 || self->_isDisabled != v8->_isDisabled)
  {
    LODWORD(v144) = v44;
    LODWORD(v145) = v38;
LABEL_158:
    *(_QWORD *)&v134[8] = 0;
    v142 = 0;
    v141 = 0;
    v14 = 0;
    v140 = 0;
    v15 = 0;
    v139 = 0;
    v138 = 0;
    v133 = 0;
    v137 = 0;
    v16 = 0;
    v136 = 0;
    v17 = 0;
    v135 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    v149 = 1;
    *(_DWORD *)&v134[16] = 1;
    *(_QWORD *)v134 = 1;
    goto LABEL_30;
  }
LABEL_195:
  v50 = self->_displayName;
  if (!v50)
    goto LABEL_198;
  v131 = v50;
  v51 = self->_displayName;
  HIDWORD(v142) = 0;
  if (!v8)
  {
    v112 = v51;
    displayName = 0;
    goto LABEL_204;
  }
  v52 = v131;
LABEL_203:
  v112 = v51;
  v131 = v52;
  displayName = v8->_displayName;
LABEL_204:
  v110 = displayName;
  if (!-[NSString isEqual:](v112, "isEqual:"))
  {
    v149 = 1;
    LODWORD(v144) = v44;
    LODWORD(v145) = v38;
    *(_QWORD *)&v134[4] = 0;
    v141 = 0;
    v14 = 0;
    v140 = 0;
    v15 = 0;
    v139 = 0;
    v138 = 0;
    v137 = 0;
    v16 = 0;
    v136 = 0;
    v17 = 0;
    v135 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    *(_DWORD *)&v134[12] = 1;
    *(_DWORD *)&v134[16] = 1;
    v133 = 0;
    *(_DWORD *)v134 = 1;
    LODWORD(v142) = 1;
    goto LABEL_30;
  }
  LODWORD(v142) = 1;
LABEL_214:
  LODWORD(v145) = v38;
  LODWORD(v144) = v44;
  if (self && (v55 = self->_createTime) != 0)
  {
    v130 = v55;
    v56 = self->_createTime;
    HIDWORD(v141) = 0;
    if (!v8)
    {
      v111 = v56;
      createTime = 0;
      goto LABEL_224;
    }
    v57 = v130;
  }
  else
  {
    if (!v8 || (v58 = v8->_createTime) == 0)
    {
      v130 = 0;
      v128 = 0;
      v141 = 0x100000000;
      goto LABEL_228;
    }
    v128 = v58;
    if (self)
      v56 = self->_createTime;
    else
      v56 = 0;
    v57 = 0;
    HIDWORD(v141) = 1;
  }
  v111 = v56;
  v130 = v57;
  createTime = v8->_createTime;
LABEL_224:
  v108 = createTime;
  if (!-[NSDate isEqual:](v111, "isEqual:"))
  {
    v149 = 1;
    v14 = 0;
    v140 = 0;
    v15 = 0;
    v139 = 0;
    v138 = 0;
    v133 = 0;
    v137 = 0;
    v16 = 0;
    v136 = 0;
    v17 = 0;
    v135 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    *(_DWORD *)&v134[12] = 1;
    *(_DWORD *)&v134[16] = 1;
    *(_DWORD *)v134 = 1;
    *(_DWORD *)&v134[4] = 0;
    *(_DWORD *)&v134[8] = 1;
    LODWORD(v141) = 1;
    goto LABEL_30;
  }
  LODWORD(v141) = 1;
LABEL_228:
  if (self && (v60 = self->_loginTime) != 0)
  {
    v107 = v60;
    v61 = self->_loginTime;
    HIDWORD(v140) = 0;
    if (!v8)
    {
      v109 = v61;
      loginTime = 0;
      goto LABEL_238;
    }
  }
  else
  {
    if (!v8 || (v62 = v8->_loginTime) == 0)
    {
      v107 = 0;
      v101 = 0;
      v140 = 0x100000000;
      goto LABEL_242;
    }
    v101 = v62;
    if (self)
      v61 = self->_loginTime;
    else
      v61 = 0;
    v107 = 0;
    HIDWORD(v140) = 1;
  }
  v109 = v61;
  loginTime = v8->_loginTime;
LABEL_238:
  v105 = loginTime;
  if (!-[NSDate isEqual:](v109, "isEqual:"))
  {
    v149 = 1;
    v15 = 0;
    v139 = 0;
    v138 = 0;
    v133 = 0;
    v137 = 0;
    v16 = 0;
    v136 = 0;
    v17 = 0;
    v135 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    *(_DWORD *)&v134[12] = 1;
    *(_DWORD *)&v134[16] = 1;
    *(_DWORD *)v134 = 1;
    *(_DWORD *)&v134[4] = 0;
    *(_DWORD *)&v134[8] = 1;
    v14 = 1;
    LODWORD(v140) = 1;
    goto LABEL_30;
  }
  LODWORD(v140) = 1;
LABEL_242:
  if (self && (v64 = self->_volumeUUID) != 0)
  {
    v104 = v64;
    v65 = self->_volumeUUID;
    HIDWORD(v139) = 0;
    if (!v8)
    {
      v106 = v65;
      volumeUUID = 0;
      goto LABEL_252;
    }
  }
  else
  {
    if (!v8 || (v66 = v8->_volumeUUID) == 0)
    {
      v104 = 0;
      v97 = 0;
      v139 = 0x100000000;
      goto LABEL_256;
    }
    v97 = v66;
    if (self)
      v65 = self->_volumeUUID;
    else
      v65 = 0;
    v104 = 0;
    HIDWORD(v139) = 1;
  }
  v106 = v65;
  volumeUUID = v8->_volumeUUID;
LABEL_252:
  v102 = volumeUUID;
  if (!-[NSUUID isEqual:](v106, "isEqual:"))
  {
    v149 = 1;
    v138 = 0;
    v133 = 0;
    v137 = 0;
    v16 = 0;
    v136 = 0;
    v17 = 0;
    v135 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    *(_DWORD *)&v134[12] = 1;
    *(_DWORD *)&v134[16] = 1;
    *(_DWORD *)v134 = 1;
    *(_DWORD *)&v134[4] = 0;
    *(_DWORD *)&v134[8] = 1;
    v14 = 1;
    v15 = 1;
    LODWORD(v139) = 1;
    goto LABEL_30;
  }
  LODWORD(v139) = 1;
LABEL_256:
  if (self && (v68 = self->_homeUUID) != 0)
  {
    v69 = v68;
    v70 = self->_homeUUID;
    HIDWORD(v138) = 0;
    if (!v8)
    {
      v103 = v70;
      homeUUID = 0;
      goto LABEL_266;
    }
  }
  else
  {
    if (!v8)
    {
      v69 = 0;
      v94 = 0;
      v138 = 0x100000000;
      goto LABEL_270;
    }
    v94 = v8->_homeUUID;
    if (!v94)
    {
      v69 = 0;
      v94 = 0;
      v138 = 0x100000000;
      goto LABEL_270;
    }
    if (self)
      v70 = self->_homeUUID;
    else
      v70 = 0;
    v69 = 0;
    HIDWORD(v138) = 1;
  }
  v103 = v70;
  homeUUID = v8->_homeUUID;
LABEL_266:
  v98 = homeUUID;
  v149 = 1;
  if (!-[NSUUID isEqual:](v103, "isEqual:"))
  {
    v100 = v69;
    v137 = 0;
    v16 = 0;
    v136 = 0;
    v17 = 0;
    v135 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    *(_DWORD *)&v134[12] = 1;
    *(_DWORD *)&v134[16] = 1;
    v133 = 0;
    *(_DWORD *)v134 = 1;
    *(_DWORD *)&v134[4] = 1;
    *(_DWORD *)&v134[8] = 1;
    v14 = 1;
    v15 = 1;
    LODWORD(v138) = 1;
    goto LABEL_30;
  }
  LODWORD(v138) = 1;
LABEL_270:
  v100 = v69;
  if (self && (v72 = self->_homeDir) != 0)
  {
    v96 = v72;
    v99 = self->_homeDir;
    HIDWORD(v137) = 0;
    if (!v8)
    {
      homeDir = 0;
      goto LABEL_280;
    }
  }
  else
  {
    if (!v8 || (v90 = v8->_homeDir) == 0)
    {
      v96 = 0;
      v90 = 0;
      v137 = 0x100000000;
      goto LABEL_284;
    }
    if (self)
      v99 = self->_homeDir;
    else
      v99 = 0;
    v96 = 0;
    HIDWORD(v137) = 1;
  }
  homeDir = v8->_homeDir;
LABEL_280:
  v93 = homeDir;
  v149 = 1;
  if (!-[NSString isEqual:](v99, "isEqual:"))
  {
    v16 = 0;
    v136 = 0;
    v17 = 0;
    v135 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    *(_DWORD *)&v134[12] = 1;
    *(_DWORD *)&v134[16] = 1;
    *(_DWORD *)v134 = 1;
    *(_DWORD *)&v134[4] = 1;
    *(_DWORD *)&v134[8] = 1;
    v14 = 1;
    v15 = 1;
    v133 = 1;
    LODWORD(v137) = 1;
    goto LABEL_30;
  }
  LODWORD(v137) = 1;
LABEL_284:
  if (self && (v92 = self->_deviceNode) != 0)
  {
    v95 = self->_deviceNode;
    HIDWORD(v136) = 0;
    deviceNode = v8;
    if (!v8)
      goto LABEL_294;
  }
  else
  {
    if (!v8 || (v87 = v8->_deviceNode) == 0)
    {
      v92 = 0;
      v87 = 0;
      v136 = 0x100000000;
      goto LABEL_298;
    }
    if (self)
      v95 = self->_deviceNode;
    else
      v95 = 0;
    v92 = 0;
    HIDWORD(v136) = 1;
  }
  deviceNode = (UMDPersonaManifestPersona *)v8->_deviceNode;
LABEL_294:
  v89 = deviceNode;
  v149 = 1;
  if (!-[NSString isEqual:](v95, "isEqual:"))
  {
    v17 = 0;
    v135 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    *(_DWORD *)&v134[12] = 1;
    *(_DWORD *)&v134[16] = 1;
    *(_DWORD *)v134 = 1;
    *(_DWORD *)&v134[4] = 1;
    *(_DWORD *)&v134[8] = 1;
    v14 = 1;
    v15 = 1;
    v133 = 1;
    v16 = 1;
    LODWORD(v136) = 1;
    goto LABEL_30;
  }
  LODWORD(v136) = 1;
LABEL_298:
  if (self && (v88 = self->_userUUID) != 0)
  {
    v91 = self->_userUUID;
    HIDWORD(v135) = 0;
    userUUID = v8;
    if (!v8)
      goto LABEL_308;
  }
  else
  {
    if (!v8 || (v85 = v8->_userUUID) == 0)
    {
      v88 = 0;
      v85 = 0;
      v135 = 0x100000000;
      goto LABEL_312;
    }
    if (self)
      v91 = self->_userUUID;
    else
      v91 = 0;
    v88 = 0;
    HIDWORD(v135) = 1;
  }
  userUUID = v8->_userUUID;
LABEL_308:
  v86 = userUUID;
  v149 = 1;
  if (!-[NSUUID isEqual:](v91, "isEqual:"))
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    *(_DWORD *)&v134[12] = 1;
    *(_DWORD *)&v134[16] = 1;
    *(_DWORD *)v134 = 1;
    *(_DWORD *)&v134[4] = 1;
    *(_DWORD *)&v134[8] = 1;
    v14 = 1;
    v15 = 1;
    v133 = 1;
    v16 = 1;
    v17 = 1;
    LODWORD(v135) = 1;
    goto LABEL_30;
  }
  LODWORD(v135) = 1;
LABEL_312:
  if (self)
    uid = self->_uid;
  else
    uid = 0;
  v77 = v8;
  if (v8)
    v77 = v8->_uid;
  if (uid != v77)
    goto LABEL_326;
  if (self)
    gid = self->_gid;
  else
    gid = 0;
  v79 = v8;
  if (v8)
    v79 = v8->_gid;
  if (gid != v79)
  {
LABEL_326:
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    v149 = 1;
    *(_DWORD *)&v134[12] = 1;
    *(_DWORD *)&v134[16] = 1;
    *(_DWORD *)v134 = 1;
    *(_DWORD *)&v134[4] = 1;
    *(_DWORD *)&v134[8] = 1;
    v14 = 1;
    v15 = 1;
    v133 = 1;
    v16 = 1;
    v17 = 1;
    goto LABEL_30;
  }
  if (self)
  {
    v83 = self->_encryptedVolumeKey;
    if (v83)
    {
      v84 = self->_encryptedVolumeKey;
      v81 = 0;
      encryptedVolumeKey = v8;
      if (!v8)
        goto LABEL_333;
      goto LABEL_332;
    }
  }
  v20 = (int)v8;
  if (v8)
  {
    v82 = v8->_encryptedVolumeKey;
    if (v82)
    {
      if (self)
        v84 = self->_encryptedVolumeKey;
      else
        v84 = 0;
      v83 = 0;
      v81 = 1;
LABEL_332:
      encryptedVolumeKey = v8->_encryptedVolumeKey;
LABEL_333:
      v3 = encryptedVolumeKey;
      v13 = -[NSData isEqual:](v84, "isEqual:", v3);
      v20 = 1;
      v149 = 1;
      *(_DWORD *)&v134[12] = 1;
      *(_DWORD *)&v134[16] = 1;
      *(_DWORD *)v134 = 1;
      *(_DWORD *)&v134[4] = 1;
      *(_DWORD *)&v134[8] = 1;
      v14 = 1;
      v15 = 1;
      v133 = 1;
      v16 = 1;
      v17 = 1;
      v18 = 1;
      v19 = v81;
      goto LABEL_30;
    }
    v82 = 0;
    v83 = 0;
    v20 = 0;
  }
  else
  {
    v82 = 0;
    v83 = 0;
  }
  v149 = 1;
  *(_DWORD *)&v134[12] = 1;
  *(_DWORD *)&v134[16] = 1;
  *(_DWORD *)v134 = 1;
  *(_DWORD *)&v134[4] = 1;
  *(_DWORD *)&v134[8] = 1;
  v14 = 1;
  v15 = 1;
  v133 = 1;
  v16 = 1;
  v17 = 1;
  v18 = 1;
  v19 = 1;
  v13 = 1;
LABEL_30:
  if (v20)
  {
    v27 = v8;
    v28 = v16;
    v29 = v18;
    v30 = v15;
    v31 = v14;
    v32 = v19;

    v33 = v32;
    v14 = v31;
    v15 = v30;
    v18 = v29;
    v16 = v28;
    v8 = v27;
    if (!v33)
      goto LABEL_32;
LABEL_109:

    if (!v18)
      goto LABEL_34;
    goto LABEL_33;
  }
  if (v19)
    goto LABEL_109;
LABEL_32:
  if (v18)
LABEL_33:

LABEL_34:
  if ((_DWORD)v135)
  {

  }
  if (HIDWORD(v135))

  if (v17)
  if ((_DWORD)v136)
  {

  }
  if (HIDWORD(v136))

  if (v16)
  if ((_DWORD)v137)
  {

  }
  if (HIDWORD(v137))

  if (v133)
  if ((_DWORD)v138)
  {

  }
  if (HIDWORD(v138))

  if (*(_DWORD *)&v134[4])
  if ((_DWORD)v139)
  {

  }
  if (HIDWORD(v139))

  if (v15)
  if ((_DWORD)v140)
  {

  }
  if (HIDWORD(v140))

  if (v14)
  if ((_DWORD)v141)
  {

  }
  if (HIDWORD(v141))

  if (*(_DWORD *)&v134[8])
  if ((_DWORD)v142)
  {

  }
  if (HIDWORD(v142))

  if (*(_DWORD *)&v134[12])
  if ((_DWORD)v143)
  {

  }
  if (HIDWORD(v143))

  if (*(_DWORD *)v134)
  if ((_DWORD)v144)
  {

  }
  if (HIDWORD(v144))

  if (*(_DWORD *)&v134[16])
  if ((_DWORD)v145)
  {

  }
  if (HIDWORD(v145))

  if (v149)
  if ((_DWORD)v146)
  {

  }
  if (HIDWORD(v146))

  if (v148 == v147)
LABEL_107:

  return v13;
}

- (unint64_t)hash
{
  uint64_t type;
  NSUUID *uuid;
  char *v5;
  NSString *nickname;
  char *v7;
  NSSet *bundleIDs;
  char *v9;
  NSSet *observers;
  char *v11;
  NSString *displayName;
  NSString *v13;
  char *v14;
  NSDate *createTime;
  NSDate *v16;
  char *v17;
  NSDate *loginTime;
  NSDate *v19;
  char *v20;
  NSUUID *volumeUUID;
  NSUUID *v22;
  char *v23;
  NSUUID *homeUUID;
  NSUUID *v25;
  char *v26;
  NSString *homeDir;
  NSString *v28;
  char *v29;
  NSString *deviceNode;
  NSString *v31;
  char *v32;
  NSUUID *userUUID;
  NSUUID *v34;
  char *v35;
  NSData *encryptedVolumeKey;
  char *v37;
  NSSet *v39;
  NSSet *v40;
  NSString *v41;
  NSUUID *v42;

  if (self)
  {
    type = self->_type;
    uuid = self->_uuid;
  }
  else
  {
    type = 0;
    uuid = 0;
  }
  v42 = uuid;
  v5 = (char *)-[NSUUID hash](v42, "hash") + type;
  if (self)
  {
    v5 += self->_kernelID;
    nickname = self->_nickname;
  }
  else
  {
    nickname = 0;
  }
  v41 = nickname;
  v7 = &v5[-[NSString hash](v41, "hash")];
  if (self)
    bundleIDs = self->_bundleIDs;
  else
    bundleIDs = 0;
  v40 = bundleIDs;
  v9 = (char *)-[NSSet hash](v40, "hash") + (_QWORD)v7;
  if (self)
    observers = self->_observers;
  else
    observers = 0;
  v39 = observers;
  v11 = (char *)-[NSSet hash](v39, "hash") + (_QWORD)v9;
  if (self)
  {
    v11 += self->_isDeleting + (unint64_t)self->_isDisabled;
    displayName = self->_displayName;
  }
  else
  {
    displayName = 0;
  }
  v13 = displayName;
  v14 = &v11[-[NSString hash](v13, "hash")];
  if (self)
    createTime = self->_createTime;
  else
    createTime = 0;
  v16 = createTime;
  v17 = (char *)-[NSDate hash](v16, "hash") + (_QWORD)v14;
  if (self)
    loginTime = self->_loginTime;
  else
    loginTime = 0;
  v19 = loginTime;
  v20 = (char *)-[NSDate hash](v19, "hash") + (_QWORD)v17;
  if (self)
    volumeUUID = self->_volumeUUID;
  else
    volumeUUID = 0;
  v22 = volumeUUID;
  v23 = (char *)-[NSUUID hash](v22, "hash") + (_QWORD)v20;
  if (self)
    homeUUID = self->_homeUUID;
  else
    homeUUID = 0;
  v25 = homeUUID;
  v26 = (char *)-[NSUUID hash](v25, "hash") + (_QWORD)v23;
  if (self)
    homeDir = self->_homeDir;
  else
    homeDir = 0;
  v28 = homeDir;
  v29 = (char *)-[NSString hash](v28, "hash") + (_QWORD)v26;
  if (self)
    deviceNode = self->_deviceNode;
  else
    deviceNode = 0;
  v31 = deviceNode;
  v32 = (char *)-[NSString hash](v31, "hash") + (_QWORD)v29;
  if (self)
    userUUID = self->_userUUID;
  else
    userUUID = 0;
  v34 = userUUID;
  v35 = (char *)-[NSUUID hash](v34, "hash") + (_QWORD)v32;
  if (self)
  {
    v35 += self->_uid + (unint64_t)self->_gid;
    encryptedVolumeKey = self->_encryptedVolumeKey;
  }
  else
  {
    encryptedVolumeKey = 0;
  }
  v37 = &v35[(_QWORD)-[NSData hash](encryptedVolumeKey, "hash")];

  return (unint64_t)v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedVolumeKey, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_deviceNode, 0);
  objc_storeStrong((id *)&self->_homeDir, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_volumeUUID, 0);
  objc_storeStrong((id *)&self->_loginTime, 0);
  objc_storeStrong((id *)&self->_createTime, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
