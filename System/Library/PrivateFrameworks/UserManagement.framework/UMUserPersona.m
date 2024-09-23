@implementation UMUserPersona

- (id)createPersonaContextForBackgroundProcessingWithPersonaUniqueString:(id)a3
{
  id v3;
  const char *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;

  v3 = a3;
  if (sub_18FAE9DE8())
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, *MEMORY[0x1E0CB2FE0], 45, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
    sub_18FAEA1C0();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("setup voucher for background work with account:%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v6, v13);

    v14 = mach_voucher_persona_self();
    if (!v14)
      v15 = (const char *)HIDWORD(v26);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v15, *MEMORY[0x1E0CB2D98], v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAEA1C0();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to get existing mach voucher Port with error:%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v17, v24);

    v5 = v16;
  }

  return v5;
}

- (id)generateAndRestorePersonaContextWithPersonaUniqueString:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (sub_18FAE9DE8())
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], 45, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18FAEAA50;
    v16 = sub_18FAEAA08;
    v17 = 0;
    sub_18FAE8D1C();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_18FAE8974;
    v9[3] = &unk_1E2A4B540;
    v10 = v4;
    v11 = &v12;
    sub_18FAE8C2C((uint64_t)v7, self, v9);

    v6 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPersonaNickName, 0);
  objc_storeStrong((id *)&self->_userPersonaUniqueString, 0);
  objc_storeStrong((id *)&self->personaName, 0);
}

+ (id)currentPersona
{
  return (id)objc_opt_new();
}

- (UMUserPersona)init
{
  char *v2;
  char v3;
  uint64_t current_persona;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  char *v24;
  objc_super v26;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[16];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)UMUserPersona;
  v2 = -[UMUserPersona init](&v26, sel_init);
  if (v2)
  {
    v3 = sub_18FAE9DE8();
    v34 = 0;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    memset(v33, 0, sizeof(v33));
    v27 = 2;
    current_persona = voucher_get_current_persona();
    if ((v3 & 1) == 0)
    {
      v5 = current_persona;
      if ((_DWORD)current_persona != -1)
      {
        if ((kpersona_info() & 0x80000000) == 0)
        {
          v6 = DWORD1(v28);
          *((_DWORD *)v2 + 6) = HIDWORD(v34);
          *((_DWORD *)v2 + 7) = -101;
          v2[23] = 0;
          switch(v6)
          {
            case 2:
              v7 = 2;
              v2[17] = 1;
              *(_DWORD *)(v2 + 18) = 0;
              v2[22] = 1;
              v8 = (void *)*((_QWORD *)v2 + 5);
              v9 = CFSTR("Enterprise");
              goto LABEL_12;
            case 4:
              v7 = 3;
              *(_DWORD *)(v2 + 17) = 0x10000;
              *(_WORD *)(v2 + 21) = 0;
              v8 = (void *)*((_QWORD *)v2 + 5);
              v9 = CFSTR("System");
              goto LABEL_12;
            case 5:
              *(_WORD *)(v2 + 17) = 256;
              *(_DWORD *)(v2 + 19) = 0;
              v21 = (void *)*((_QWORD *)v2 + 5);
              *((_QWORD *)v2 + 5) = CFSTR("Personal");
              *((_QWORD *)v2 + 6) = 0;

              goto LABEL_13;
            case 6:
              v7 = 5;
              *(_DWORD *)(v2 + 17) = 0x1000000;
              *(_WORD *)(v2 + 21) = 0;
              v8 = (void *)*((_QWORD *)v2 + 5);
              v9 = CFSTR("Default");
LABEL_12:
              *((_QWORD *)v2 + 5) = v9;
              *((_QWORD *)v2 + 6) = v7;

LABEL_13:
              objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v22, (uint64_t)v33 + 4);
              v23 = objc_claimAutoreleasedReturnValue();
              v20 = (void *)*((_QWORD *)v2 + 4);
              *((_QWORD *)v2 + 4) = v23;
              break;
            default:
              goto LABEL_8;
          }
          goto LABEL_14;
        }
        v10 = __error();
        strerror(*v10);
        sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Could not get current persona Info for id:%d with error:%s"), v11, v12, v13, v14, v15, v16, v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAEA1C0();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE964C((uint64_t)v18, v17);

      }
    }
LABEL_8:
    *((_QWORD *)v2 + 3) = 0x6400000064;
    v2[23] = 0;
    *(_DWORD *)(v2 + 17) = 0;
    *(_WORD *)(v2 + 21) = 0;
    v19 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = CFSTR("Invalid");
    *((_QWORD *)v2 + 6) = 1000;

    v20 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = 0;
LABEL_14:

    v24 = v2;
  }

  return (UMUserPersona *)v2;
}

- (unint64_t)userPersonaType
{
  return self->_userPersonaType;
}

- (BOOL)isDataSeparatedPersona
{
  return self->_isDataSeparatedPersona;
}

- (BOOL)isEnterprisePersona
{
  return self->_isEnterprisePersona;
}

- (NSString)userPersonaUniqueString
{
  return self->_userPersonaUniqueString;
}

- (BOOL)isGuestPersona
{
  return self->_isGuestPersona;
}

- (BOOL)isPersonalPersona
{
  return self->_isPersonalPersona;
}

- (BOOL)isDefaultPersona
{
  return self->_isDefaultPersona;
}

- (BOOL)isSystemPersona
{
  return self->_isSystemPersona;
}

- (id)restorePersonaWithSavedPersonaContext:(id)a3
{
  if (a3)
    objc_msgSend_contextAdopt(a3, a2, (uint64_t)a3);
  return 0;
}

- (id)generateAndRestorePersonaContextWithIdentityString:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_generateAndRestorePersonaContextWithPersonaUniqueString_, a3);
}

- (id)copyCurrentPersonaContextWithError:(id *)a3
{
  if (a3)
    *a3 = 0;
  return objc_alloc_init(UMUserPersonaContext);
}

+ (BOOL)currentPersonaMatchesPath:(id)a3
{
  id v3;
  const char *v4;
  char *v5;
  char *v6;
  uint64_t current_persona;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[1024];
  char v31[1384];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  memset(&v31[1024], 0, 348);
  if (v3)
  {
    if ((sub_18FAE9DE8() & 1) == 0)
    {
      if (objc_msgSend_getCString_maxLength_encoding_(v3, v4, (uint64_t)v31, 1024, 4))
      {
        v5 = realpath_DARWIN_EXTSN(v31, 0);
        if (v5)
        {
          v6 = v5;
          memset(&v31[1028], 0, 344);
          *(_DWORD *)&v31[1024] = 1;
          current_persona = voucher_get_current_persona();
          if ((_DWORD)current_persona != -1)
          {
            v9 = current_persona;
            if ((kpersona_info() & 0x80000000) != 0)
            {
              v15 = *__error();
              sub_18FAEA1C0();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              strerror(v15);
              sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Could not get current persona Info for id:%d with error:%s"), v17, v18, v19, v20, v21, v22, v9);
LABEL_16:
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              sub_18FAE964C((uint64_t)v16, v13);

              LOBYTE(v13) = 0;
              goto LABEL_19;
            }
            if (*(_DWORD *)&v31[1032] == 2)
            {
              if ((kpersona_getpath() & 0x80000000) == 0)
              {
                objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v10, (uint64_t)v30);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                if (v12)
                  LOBYTE(v13) = objc_msgSend_hasPrefix_(v3, v11, (uint64_t)v12);
                else
                  LOBYTE(v13) = 0;

                goto LABEL_19;
              }
              v23 = *__error();
              sub_18FAEA1C0();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              strerror(v23);
              sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Could not get persona path for id:%d with error:%s"), v24, v25, v26, v27, v28, v29, v9);
              goto LABEL_16;
            }
          }
          LODWORD(v13) = objc_msgSend_hasPrefix_(v3, v8, (uint64_t)CFSTR("/private/var/PersonaVolumes")) ^ 1;
LABEL_19:
          free(v6);
          goto LABEL_12;
        }
      }
    }
  }
  LOBYTE(v13) = 0;
LABEL_12:

  return (char)v13;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unsigned)gid
{
  return self->_gid;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (NSString)userPersonaNickName
{
  return self->_userPersonaNickName;
}

- (id)createPersonaContextForBackgroundProcessingWithIdentityString:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_createPersonaContextForBackgroundProcessingWithPersonaUniqueString_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  sub_18FB07A5C((uint64_t)v4, self);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  sub_18FB07A5C((uint64_t)v4, self);
  return v4;
}

- (BOOL)commitChanges
{
  return MEMORY[0x1E0DE7D20](self, sel_commitChangesWithError_, 0);
}

- (BOOL)commitChangesWithError:(id *)a3
{
  return 0;
}

- (BOOL)isEqualToPersona:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  char v10;
  BOOL v11;
  char isEqualToString;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = objc_msgSend_userPersonaType(self, v5, v6);
    if (v7 <= 5 && ((1 << v7) & 0x2D) != 0)
    {
      v10 = 0;
      v11 = 1;
    }
    else
    {
      v10 = 1;
      v11 = v7 != 1000;
    }
    v13 = objc_msgSend_userPersonaType(v4, v8, v9);
    if (v13 <= 5 && ((1 << v13) & 0x2D) != 0)
    {
      if ((v10 & 1) == 0)
      {
        objc_msgSend_userPersonaUniqueString(self, v14, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userPersonaUniqueString(v4, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v17, v21, (uint64_t)v20);

        goto LABEL_15;
      }
      v16 = 1;
    }
    else
    {
      v16 = v13 != 1000;
    }
    isEqualToString = !v11 && !v16;
  }
  else
  {
    isEqualToString = 0;
  }
LABEL_15:

  return isEqualToString;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (void)setIsEnterprisePersona:(BOOL)a3
{
  self->_isEnterprisePersona = a3;
}

- (void)setIsPersonalPersona:(BOOL)a3
{
  self->_isPersonalPersona = a3;
}

- (void)setIsSystemPersona:(BOOL)a3
{
  self->_isSystemPersona = a3;
}

- (void)setIsDefaultPersona:(BOOL)a3
{
  self->_isDefaultPersona = a3;
}

- (void)setIsGuestPersona:(BOOL)a3
{
  self->_isGuestPersona = a3;
}

- (void)setIsDataSeparatedPersona:(BOOL)a3
{
  self->_isDataSeparatedPersona = a3;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (void)setUserPersonaUniqueString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setUserPersonaNickName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setUserPersonaType:(unint64_t)a3
{
  self->_userPersonaType = a3;
}

@end
