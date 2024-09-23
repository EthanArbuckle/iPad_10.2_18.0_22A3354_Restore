@implementation UMUserPersonaAttributes

+ (id)personaAttributesForPersonaType:(unint64_t)a3 withError:(id *)a4
{
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v30;
  __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  v6 = 0;
  if (a3 <= 4 && a3 != 1)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], a2, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = kUMUserPersonaTypeKey;
    v32[0] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v32, &v31, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE7234();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    sub_18FAEAE00(v10, v9, &v30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v30;

    if (v11 && !v12)
    {
      objc_msgSend_setUpPersonaAttributesWithDictionary_(UMUserPersonaAttributes, v13, (uint64_t)v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      return v6;
    }
    objc_msgSend_domain(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v15, v16, *MEMORY[0x1E0CB2FE0]))
    {
      v19 = objc_msgSend_code(v12, v17, v18);

      if (v19 == 2)
      {
        sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("No persona found for the type %lu"), v20, v21, v22, v23, v24, v25, a3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAEA1C0();
        v27 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v28 = (void *)v27;
        sub_18FAE964C(v27, v26);

        if (a4)
          *a4 = objc_retainAutorelease(v12);

        v6 = 0;
        goto LABEL_16;
      }
    }
    else
    {

    }
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("personaAttributesForPersonaType for type:%lu failed with error %@"), v20, v21, v22, v23, v24, v25, a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAEBC90();
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  return v6;
}

+ (id)personaAttributesForPersonaType:(unint64_t)a3
{
  return (id)objc_msgSend_personaAttributesForPersonaType_withError_(a1, a2, a3, 0);
}

+ (id)personaAttributes
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;

  sub_18FAE9B44();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  if (v2 && (objc_msgSend_userPersonaUniqueString(v2, v3, v4), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    objc_msgSend_personaAttributesForPersonaUniqueString_(UMUserPersonaAttributes, v3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend_userPersonaType(v5, v3, v4))
  {
    v11 = objc_msgSend_userPersonaType(v5, v9, v10);
    objc_msgSend_personaAttributesForPersonaType_(UMUserPersonaAttributes, v12, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)setUpPersonaAttributesWithDictionary:(id)a3
{
  id v3;
  UMUserPersonaAttributes *v4;
  const char *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  const char *v48;
  void *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  void *v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(UMUserPersonaAttributes);
    objc_msgSend_setPersonaLayoutPathURL_(v4, v5, 0);
    objc_msgSend_objectForKeyedSubscript_(v3, v6, (uint64_t)kUMUserPersonaUniqueStringKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaUniqueString_(v4, v8, (uint64_t)v7);

    objc_msgSend_objectForKeyedSubscript_(v3, v9, (uint64_t)kUMUserPersonaIDKey);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    if (v10)
    {
      v14 = objc_msgSend_integerValue(v10, v11, v12);
      objc_msgSend_setUserPersona_id_(v4, v15, v14);
    }
    objc_msgSend_objectForKeyedSubscript_(v3, v11, (uint64_t)kUMUserPersonaTypeKey);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v16;
    if (v16)
    {
      v20 = objc_msgSend_integerValue(v16, v17, v18);
      objc_msgSend_setUserPersonaType_(v4, v21, v20);
    }
    else
    {
      objc_msgSend_setUserPersonaType_(v4, v17, 1000);
    }
    objc_msgSend_setIsPersonalPersona_(v4, v22, 0);
    objc_msgSend_setIsEnterprisePersona_(v4, v23, 0);
    objc_msgSend_setIsUniversalPersona_(v4, v24, 0);
    objc_msgSend_setIsSystemPersona_(v4, v25, 0);
    objc_msgSend_setIsDefaultPersona_(v4, v26, 0);
    objc_msgSend_setIsGuestPersona_(v4, v27, 0);
    objc_msgSend_setIsDataSeparatedPersona_(v4, v28, 0);
    if (objc_msgSend_userPersonaType(v4, v29, v30))
    {
      if (objc_msgSend_userPersonaType(v4, v31, v32) == 2)
      {
        objc_msgSend_setIsEnterprisePersona_(v4, v33, 1);
        objc_msgSend_setIsDataSeparatedPersona_(v4, v35, 1);
      }
      else if (objc_msgSend_userPersonaType(v4, v33, v34) == 4)
      {
        objc_msgSend_setIsUniversalPersona_(v4, v37, 1);
      }
      else if (objc_msgSend_userPersonaType(v4, v37, v38) == 3)
      {
        objc_msgSend_setIsSystemPersona_(v4, v39, 1);
      }
      else if (objc_msgSend_userPersonaType(v4, v39, v40) == 5)
      {
        objc_msgSend_setIsDefaultPersona_(v4, v36, 1);
      }
    }
    else
    {
      objc_msgSend_setIsPersonalPersona_(v4, v31, 1);
    }
    objc_msgSend_setIsDisabled_(v4, v36, 0);
    objc_msgSend_objectForKeyedSubscript_(v3, v41, (uint64_t)kUMUserPersonaDisabledKey);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v42;
    if (v42 && objc_msgSend_BOOLValue(v42, v43, v44))
      objc_msgSend_setIsDisabled_(v4, v43, 1);
    objc_msgSend_objectForKeyedSubscript_(v3, v43, (uint64_t)kUMUserPersonaDisplayNameKey);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaDisplayName_(v4, v47, (uint64_t)v46);

    objc_msgSend_objectForKeyedSubscript_(v3, v48, (uint64_t)kUMUserPersonaBundleIDsKey);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaBundleIDList_(v4, v50, (uint64_t)v49);

    objc_msgSend_objectForKeyedSubscript_(v3, v51, kUMUserSessionHomeDirKey);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E0C99E98], v52, (uint64_t)v53, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPersonaLayoutPathURL_(v4, v55, (uint64_t)v54);

    }
    objc_msgSend_objectForKeyedSubscript_(v3, v52, kUMUserSessionCreateTimeStampKey);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreationDate_(v4, v57, (uint64_t)v56);

    objc_msgSend_setLastEnableDate_(v4, v58, 0);
    objc_msgSend_setLastDisableDate_(v4, v59, 0);
    objc_msgSend_setLastLoginDate_(v4, v60, 0);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)personaAttributesForPersonaUniqueString:(id)a3
{
  return (id)objc_msgSend_personaAttributesForPersonaUniqueString_withError_(a1, a2, (uint64_t)a3, 0);
}

+ (id)personaAttributesForPersonaUniqueString:(id)a3 withError:(id *)a4
{
  id v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v30;
  __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v7 = v5;
  if (a4)
    *a4 = 0;
  if (v5)
  {
    v31 = kUMUserPersonaUniqueStringKey;
    v32[0] = v5;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v32, &v31, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE7234();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    sub_18FAEAE00(v9, v8, &v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v30;

    if (!v11 && v10)
      goto LABEL_6;
    objc_msgSend_domain(v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v15, v16, *MEMORY[0x1E0CB2FE0]))
    {
      v19 = objc_msgSend_code(v11, v17, v18);

      if (v19 == 2)
      {
        sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("No persona found with unique string %@"), v20, v21, v22, v23, v24, v25, (uint64_t)v7);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAEA1C0();
        v27 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v28 = (void *)v27;
        sub_18FAE964C(v27, v26);

        if (a4)
        {
          *a4 = objc_retainAutorelease(v11);

          v14 = 0;
          goto LABEL_15;
        }

        if (!v10)
        {
          v14 = 0;
          v10 = v11;
          goto LABEL_16;
        }
LABEL_6:
        objc_msgSend_setUpPersonaAttributesWithDictionary_(UMUserPersonaAttributes, v12, (uint64_t)v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

        v8 = v11;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {

    }
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("personaAttributesForPersonaUniqueString:%@ failed with error %@"), v20, v21, v22, v23, v24, v25, (uint64_t)v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAEBC90();
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v14 = 0;
LABEL_17:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  sub_18FAF738C(v4, self);
  return v4;
}

+ (id)currentContextIdentifier
{
  int v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;

  v2 = sub_18FAE9DE8();
  objc_msgSend_sharedManager(UMUserManager, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (!v2)
  {
    objc_msgSend_currentPersona(v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend_userPersonaUniqueString(v9, v16, v17);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  objc_msgSend_currentUser(v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_7;
  v12 = objc_msgSend_uid(v9, v10, v11);
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  v15 = objc_msgSend_initWithFormat_(v13, v14, (uint64_t)CFSTR("%d"), v12);
LABEL_6:
  v18 = (void *)v15;
LABEL_8:

  return v18;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_userPersonaUniqueString(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_userPersona_id(self, v6, v7);
  objc_msgSend_stringWithFormat_(v4, v9, (uint64_t)CFSTR("%p(Persona Unique String: %@, Persona ID:%d)"), self, v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)sandboxExtensionForPersonaLayoutPath
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend_personaLayoutPathURL(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    sub_18FAE7234();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userPersonaUniqueString(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FB02190(v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (NSString)userPersonaUniqueString
{
  return self->_userPersonaUniqueString;
}

- (void)setUserPersonaUniqueString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)userPersonaType
{
  return self->_userPersonaType;
}

- (void)setUserPersonaType:(unint64_t)a3
{
  self->_userPersonaType = a3;
}

- (unsigned)userPersona_id
{
  return self->_userPersona_id;
}

- (void)setUserPersona_id:(unsigned int)a3
{
  self->_userPersona_id = a3;
}

- (NSURL)personaLayoutPathURL
{
  return self->_personaLayoutPathURL;
}

- (void)setPersonaLayoutPathURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isEnterprisePersona
{
  return self->_isEnterprisePersona;
}

- (void)setIsEnterprisePersona:(BOOL)a3
{
  self->_isEnterprisePersona = a3;
}

- (BOOL)isPersonalPersona
{
  return self->_isPersonalPersona;
}

- (void)setIsPersonalPersona:(BOOL)a3
{
  self->_isPersonalPersona = a3;
}

- (BOOL)isUniversalPersona
{
  return self->_isUniversalPersona;
}

- (void)setIsUniversalPersona:(BOOL)a3
{
  self->_isUniversalPersona = a3;
}

- (BOOL)isSystemPersona
{
  return self->_isSystemPersona;
}

- (void)setIsSystemPersona:(BOOL)a3
{
  self->_isSystemPersona = a3;
}

- (BOOL)isDefaultPersona
{
  return self->_isDefaultPersona;
}

- (void)setIsDefaultPersona:(BOOL)a3
{
  self->_isDefaultPersona = a3;
}

- (BOOL)isGuestPersona
{
  return self->_isGuestPersona;
}

- (void)setIsGuestPersona:(BOOL)a3
{
  self->_isGuestPersona = a3;
}

- (BOOL)isDataSeparatedPersona
{
  return self->_isDataSeparatedPersona;
}

- (void)setIsDataSeparatedPersona:(BOOL)a3
{
  self->_isDataSeparatedPersona = a3;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (NSArray)userPersonaBundleIDList
{
  return self->_userPersonaBundleIDList;
}

- (void)setUserPersonaBundleIDList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)userPersonaDisplayName
{
  return self->_userPersonaDisplayName;
}

- (void)setUserPersonaDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)lastLoginDate
{
  return self->_lastLoginDate;
}

- (void)setLastLoginDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)lastDisableDate
{
  return self->_lastDisableDate;
}

- (void)setLastDisableDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)lastEnableDate
{
  return self->_lastEnableDate;
}

- (void)setLastEnableDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEnableDate, 0);
  objc_storeStrong((id *)&self->_lastDisableDate, 0);
  objc_storeStrong((id *)&self->_lastLoginDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_userPersonaDisplayName, 0);
  objc_storeStrong((id *)&self->_userPersonaBundleIDList, 0);
  objc_storeStrong((id *)&self->_personaLayoutPathURL, 0);
  objc_storeStrong((id *)&self->_userPersonaUniqueString, 0);
}

@end
