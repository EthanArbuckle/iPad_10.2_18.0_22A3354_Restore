@implementation TISupplementalPersonItem

- (TISupplementalPersonItem)initWithContact:(id)a3
{
  id v4;
  TISupplementalPersonItem *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *givenName;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *phoneticGivenName;
  _QWORD *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *middleName;
  _QWORD *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *phoneticMiddleName;
  _QWORD *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *familyName;
  _QWORD *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSString *phoneticFamilyName;
  _QWORD *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSString *previousFamilyName;
  _QWORD *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSString *organizationName;
  _QWORD *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSString *phoneticOrganizationName;
  _QWORD *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSString *nickname;
  TISupplementalPersonItem *v56;
  TISupplementalPersonItem *v58;
  SEL v59;
  id v60;
  objc_super v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)TISupplementalPersonItem;
  v5 = -[TISupplementalItem init](&v61, sel_init);
  if (!v5)
  {
LABEL_53:

    return v5;
  }
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v6 = (_QWORD *)getCNContactGivenNameKeySymbolLoc_ptr;
  v65 = getCNContactGivenNameKeySymbolLoc_ptr;
  if (!getCNContactGivenNameKeySymbolLoc_ptr)
  {
    v7 = (void *)ContactsLibrary();
    v6 = dlsym(v7, "CNContactGivenNameKey");
    v63[3] = (uint64_t)v6;
    getCNContactGivenNameKeySymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v62, 8);
  if (v6)
  {
    if (objc_msgSend(v4, "isKeyAvailable:", *v6))
    {
      objc_msgSend(v4, "givenName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      givenName = v5->_givenName;
      v5->_givenName = (NSString *)v9;

    }
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v11 = (_QWORD *)getCNContactPhoneticGivenNameKeySymbolLoc_ptr;
    v65 = getCNContactPhoneticGivenNameKeySymbolLoc_ptr;
    if (!getCNContactPhoneticGivenNameKeySymbolLoc_ptr)
    {
      v12 = (void *)ContactsLibrary();
      v11 = dlsym(v12, "CNContactPhoneticGivenNameKey");
      v63[3] = (uint64_t)v11;
      getCNContactPhoneticGivenNameKeySymbolLoc_ptr = (uint64_t)v11;
    }
    _Block_object_dispose(&v62, 8);
    if (v11)
    {
      if (objc_msgSend(v4, "isKeyAvailable:", *v11))
      {
        objc_msgSend(v4, "phoneticGivenName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "copy");
        phoneticGivenName = v5->_phoneticGivenName;
        v5->_phoneticGivenName = (NSString *)v14;

      }
      v62 = 0;
      v63 = &v62;
      v64 = 0x2020000000;
      v16 = (_QWORD *)getCNContactMiddleNameKeySymbolLoc_ptr;
      v65 = getCNContactMiddleNameKeySymbolLoc_ptr;
      if (!getCNContactMiddleNameKeySymbolLoc_ptr)
      {
        v17 = (void *)ContactsLibrary();
        v16 = dlsym(v17, "CNContactMiddleNameKey");
        v63[3] = (uint64_t)v16;
        getCNContactMiddleNameKeySymbolLoc_ptr = (uint64_t)v16;
      }
      _Block_object_dispose(&v62, 8);
      if (v16)
      {
        if (objc_msgSend(v4, "isKeyAvailable:", *v16))
        {
          objc_msgSend(v4, "middleName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "copy");
          middleName = v5->_middleName;
          v5->_middleName = (NSString *)v19;

        }
        v62 = 0;
        v63 = &v62;
        v64 = 0x2020000000;
        v21 = (_QWORD *)getCNContactPhoneticMiddleNameKeySymbolLoc_ptr;
        v65 = getCNContactPhoneticMiddleNameKeySymbolLoc_ptr;
        if (!getCNContactPhoneticMiddleNameKeySymbolLoc_ptr)
        {
          v22 = (void *)ContactsLibrary();
          v21 = dlsym(v22, "CNContactPhoneticMiddleNameKey");
          v63[3] = (uint64_t)v21;
          getCNContactPhoneticMiddleNameKeySymbolLoc_ptr = (uint64_t)v21;
        }
        _Block_object_dispose(&v62, 8);
        if (v21)
        {
          if (objc_msgSend(v4, "isKeyAvailable:", *v21))
          {
            objc_msgSend(v4, "phoneticMiddleName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "copy");
            phoneticMiddleName = v5->_phoneticMiddleName;
            v5->_phoneticMiddleName = (NSString *)v24;

          }
          v62 = 0;
          v63 = &v62;
          v64 = 0x2020000000;
          v26 = (_QWORD *)getCNContactFamilyNameKeySymbolLoc_ptr;
          v65 = getCNContactFamilyNameKeySymbolLoc_ptr;
          if (!getCNContactFamilyNameKeySymbolLoc_ptr)
          {
            v27 = (void *)ContactsLibrary();
            v26 = dlsym(v27, "CNContactFamilyNameKey");
            v63[3] = (uint64_t)v26;
            getCNContactFamilyNameKeySymbolLoc_ptr = (uint64_t)v26;
          }
          _Block_object_dispose(&v62, 8);
          if (v26)
          {
            if (objc_msgSend(v4, "isKeyAvailable:", *v26))
            {
              objc_msgSend(v4, "familyName");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "copy");
              familyName = v5->_familyName;
              v5->_familyName = (NSString *)v29;

            }
            v62 = 0;
            v63 = &v62;
            v64 = 0x2020000000;
            v31 = (_QWORD *)getCNContactPhoneticFamilyNameKeySymbolLoc_ptr;
            v65 = getCNContactPhoneticFamilyNameKeySymbolLoc_ptr;
            if (!getCNContactPhoneticFamilyNameKeySymbolLoc_ptr)
            {
              v32 = (void *)ContactsLibrary();
              v31 = dlsym(v32, "CNContactPhoneticFamilyNameKey");
              v63[3] = (uint64_t)v31;
              getCNContactPhoneticFamilyNameKeySymbolLoc_ptr = (uint64_t)v31;
            }
            _Block_object_dispose(&v62, 8);
            if (v31)
            {
              if (objc_msgSend(v4, "isKeyAvailable:", *v31))
              {
                objc_msgSend(v4, "phoneticFamilyName");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "copy");
                phoneticFamilyName = v5->_phoneticFamilyName;
                v5->_phoneticFamilyName = (NSString *)v34;

              }
              v62 = 0;
              v63 = &v62;
              v64 = 0x2020000000;
              v36 = (_QWORD *)getCNContactPreviousFamilyNameKeySymbolLoc_ptr;
              v65 = getCNContactPreviousFamilyNameKeySymbolLoc_ptr;
              if (!getCNContactPreviousFamilyNameKeySymbolLoc_ptr)
              {
                v37 = (void *)ContactsLibrary();
                v36 = dlsym(v37, "CNContactPreviousFamilyNameKey");
                v63[3] = (uint64_t)v36;
                getCNContactPreviousFamilyNameKeySymbolLoc_ptr = (uint64_t)v36;
              }
              _Block_object_dispose(&v62, 8);
              if (v36)
              {
                if (objc_msgSend(v4, "isKeyAvailable:", *v36))
                {
                  objc_msgSend(v4, "previousFamilyName");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = objc_msgSend(v38, "copy");
                  previousFamilyName = v5->_previousFamilyName;
                  v5->_previousFamilyName = (NSString *)v39;

                }
                v62 = 0;
                v63 = &v62;
                v64 = 0x2020000000;
                v41 = (_QWORD *)getCNContactOrganizationNameKeySymbolLoc_ptr;
                v65 = getCNContactOrganizationNameKeySymbolLoc_ptr;
                if (!getCNContactOrganizationNameKeySymbolLoc_ptr)
                {
                  v42 = (void *)ContactsLibrary();
                  v41 = dlsym(v42, "CNContactOrganizationNameKey");
                  v63[3] = (uint64_t)v41;
                  getCNContactOrganizationNameKeySymbolLoc_ptr = (uint64_t)v41;
                }
                _Block_object_dispose(&v62, 8);
                if (v41)
                {
                  if (objc_msgSend(v4, "isKeyAvailable:", *v41))
                  {
                    objc_msgSend(v4, "organizationName");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = objc_msgSend(v43, "copy");
                    organizationName = v5->_organizationName;
                    v5->_organizationName = (NSString *)v44;

                  }
                  v62 = 0;
                  v63 = &v62;
                  v64 = 0x2020000000;
                  v46 = (_QWORD *)getCNContactPhoneticOrganizationNameKeySymbolLoc_ptr;
                  v65 = getCNContactPhoneticOrganizationNameKeySymbolLoc_ptr;
                  if (!getCNContactPhoneticOrganizationNameKeySymbolLoc_ptr)
                  {
                    v47 = (void *)ContactsLibrary();
                    v46 = dlsym(v47, "CNContactPhoneticOrganizationNameKey");
                    v63[3] = (uint64_t)v46;
                    getCNContactPhoneticOrganizationNameKeySymbolLoc_ptr = (uint64_t)v46;
                  }
                  _Block_object_dispose(&v62, 8);
                  if (v46)
                  {
                    if (objc_msgSend(v4, "isKeyAvailable:", *v46))
                    {
                      objc_msgSend(v4, "phoneticOrganizationName");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      v49 = objc_msgSend(v48, "copy");
                      phoneticOrganizationName = v5->_phoneticOrganizationName;
                      v5->_phoneticOrganizationName = (NSString *)v49;

                    }
                    v62 = 0;
                    v63 = &v62;
                    v64 = 0x2020000000;
                    v51 = (_QWORD *)getCNContactNicknameKeySymbolLoc_ptr;
                    v65 = getCNContactNicknameKeySymbolLoc_ptr;
                    if (!getCNContactNicknameKeySymbolLoc_ptr)
                    {
                      v52 = (void *)ContactsLibrary();
                      v51 = dlsym(v52, "CNContactNicknameKey");
                      v63[3] = (uint64_t)v51;
                      getCNContactNicknameKeySymbolLoc_ptr = (uint64_t)v51;
                    }
                    _Block_object_dispose(&v62, 8);
                    if (v51)
                    {
                      if (objc_msgSend(v4, "isKeyAvailable:", *v51))
                      {
                        objc_msgSend(v4, "nickname");
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        v54 = objc_msgSend(v53, "copy");
                        nickname = v5->_nickname;
                        v5->_nickname = (NSString *)v54;

                      }
                      v56 = v5;
                      goto LABEL_53;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  dlerror();
  v58 = (TISupplementalPersonItem *)abort_report_np();
  return -[TISupplementalPersonItem initWithPersonNameComponents:](v58, v59, v60);
}

- (TISupplementalPersonItem)initWithPersonNameComponents:(id)a3
{
  id v4;
  TISupplementalPersonItem *v5;
  void *v6;
  uint64_t v7;
  NSString *givenName;
  void *v9;
  uint64_t v10;
  NSString *middleName;
  void *v12;
  uint64_t v13;
  NSString *familyName;
  void *v15;
  uint64_t v16;
  NSString *nickname;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *phoneticGivenName;
  void *v23;
  uint64_t v24;
  NSString *phoneticMiddleName;
  void *v26;
  uint64_t v27;
  NSString *phoneticFamilyName;
  TISupplementalPersonItem *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)TISupplementalPersonItem;
  v5 = -[TISupplementalItem init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "givenName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v7;

    objc_msgSend(v4, "middleName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    middleName = v5->_middleName;
    v5->_middleName = (NSString *)v10;

    objc_msgSend(v4, "familyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v13;

    objc_msgSend(v4, "nickname");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    nickname = v5->_nickname;
    v5->_nickname = (NSString *)v16;

    objc_msgSend(v4, "phoneticRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "givenName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      phoneticGivenName = v5->_phoneticGivenName;
      v5->_phoneticGivenName = (NSString *)v21;

      objc_msgSend(v19, "middleName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      phoneticMiddleName = v5->_phoneticMiddleName;
      v5->_phoneticMiddleName = (NSString *)v24;

      objc_msgSend(v19, "familyName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      phoneticFamilyName = v5->_phoneticFamilyName;
      v5->_phoneticFamilyName = (NSString *)v27;

    }
    v29 = v5;

  }
  return v5;
}

- (NSPersonNameComponents)personNameComponents
{
  BOOL v3;
  char v4;
  void *v5;
  void *v6;
  NSString *phoneticGivenName;
  void *v8;
  NSString *phoneticMiddleName;
  void *v10;
  NSString *phoneticFamilyName;
  void *v12;

  if (-[NSString length](self->_organizationName, "length"))
    v3 = 1;
  else
    v3 = -[NSString length](self->_phoneticOrganizationName, "length") != 0;
  if (-[NSString length](self->_givenName, "length")
    || -[NSString length](self->_phoneticGivenName, "length")
    || -[NSString length](self->_middleName, "length")
    || -[NSString length](self->_phoneticMiddleName, "length")
    || -[NSString length](self->_familyName, "length")
    || -[NSString length](self->_phoneticFamilyName, "length")
    || (!-[NSString length](self->_nickname, "length") ? (v4 = 1) : (v4 = v3), (v4 & 1) == 0))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setGivenName:", self->_givenName);
    objc_msgSend(v5, "setMiddleName:", self->_middleName);
    objc_msgSend(v5, "setFamilyName:", self->_familyName);
    objc_msgSend(v5, "setNickname:", self->_nickname);
    if (-[NSString length](self->_phoneticGivenName, "length")
      || -[NSString length](self->_phoneticFamilyName, "length")
      || -[NSString length](self->_phoneticMiddleName, "length"))
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(v5, "setPhoneticRepresentation:", v6);

      phoneticGivenName = self->_phoneticGivenName;
      objc_msgSend(v5, "phoneticRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setGivenName:", phoneticGivenName);

      phoneticMiddleName = self->_phoneticMiddleName;
      objc_msgSend(v5, "phoneticRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMiddleName:", phoneticMiddleName);

      phoneticFamilyName = self->_phoneticFamilyName;
      objc_msgSend(v5, "phoneticRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFamilyName:", phoneticFamilyName);

    }
  }
  else
  {
    v5 = 0;
  }
  return (NSPersonNameComponents *)v5;
}

- (TISupplementalPersonItem)initWithCoder:(id)a3
{
  id v4;
  TISupplementalPersonItem *v5;
  uint64_t v6;
  NSString *givenName;
  uint64_t v8;
  NSString *phoneticGivenName;
  uint64_t v10;
  NSString *middleName;
  uint64_t v12;
  NSString *phoneticMiddleName;
  uint64_t v14;
  NSString *familyName;
  uint64_t v16;
  NSString *phoneticFamilyName;
  uint64_t v18;
  NSString *organizationName;
  uint64_t v20;
  NSString *phoneticOrganizationName;
  uint64_t v22;
  NSString *nickname;
  uint64_t v24;
  NSString *previousFamilyName;
  TISupplementalPersonItem *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)TISupplementalPersonItem;
  v5 = -[TISupplementalItem initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("givenName"));
    v6 = objc_claimAutoreleasedReturnValue();
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneticGivenName"));
    v8 = objc_claimAutoreleasedReturnValue();
    phoneticGivenName = v5->_phoneticGivenName;
    v5->_phoneticGivenName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneticMiddleName"));
    v10 = objc_claimAutoreleasedReturnValue();
    middleName = v5->_middleName;
    v5->_middleName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneticMiddleName"));
    v12 = objc_claimAutoreleasedReturnValue();
    phoneticMiddleName = v5->_phoneticMiddleName;
    v5->_phoneticMiddleName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("familyName"));
    v14 = objc_claimAutoreleasedReturnValue();
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneticFamilyName"));
    v16 = objc_claimAutoreleasedReturnValue();
    phoneticFamilyName = v5->_phoneticFamilyName;
    v5->_phoneticFamilyName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organizationName"));
    v18 = objc_claimAutoreleasedReturnValue();
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneticOrganizationName"));
    v20 = objc_claimAutoreleasedReturnValue();
    phoneticOrganizationName = v5->_phoneticOrganizationName;
    v5->_phoneticOrganizationName = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nickname"));
    v22 = objc_claimAutoreleasedReturnValue();
    nickname = v5->_nickname;
    v5->_nickname = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousFamilyName"));
    v24 = objc_claimAutoreleasedReturnValue();
    previousFamilyName = v5->_previousFamilyName;
    v5->_previousFamilyName = (NSString *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TISupplementalPersonItem;
  v4 = a3;
  -[TISupplementalItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_givenName, CFSTR("givenName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_phoneticGivenName, CFSTR("phoneticGivenName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_middleName, CFSTR("middleName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_phoneticMiddleName, CFSTR("phoneticMiddleName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_familyName, CFSTR("familyName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_phoneticFamilyName, CFSTR("phoneticFamilyName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_organizationName, CFSTR("organizationName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_phoneticOrganizationName, CFSTR("phoneticOrganizationName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_nickname, CFSTR("nickname"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_previousFamilyName, CFSTR("previousFamilyName"));

}

- (id)description
{
  NSString *givenName;
  NSString *phoneticGivenName;
  NSString *middleName;
  NSString *phoneticMiddleName;
  NSString *familyName;
  NSString *phoneticFamilyName;
  NSString *previousFamilyName;
  NSString *organizationName;
  NSString *phoneticOrganizationName;
  NSString *nickname;
  void *v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[21];

  v23[20] = *MEMORY[0x1E0C80C00];
  givenName = self->_givenName;
  v23[0] = "givenName";
  v23[1] = givenName;
  phoneticGivenName = self->_phoneticGivenName;
  v23[2] = "phoneticGivenName";
  v23[3] = phoneticGivenName;
  middleName = self->_middleName;
  v23[4] = "middleName";
  v23[5] = middleName;
  phoneticMiddleName = self->_phoneticMiddleName;
  v23[6] = "phoneticMiddleName";
  v23[7] = phoneticMiddleName;
  familyName = self->_familyName;
  v23[8] = "familyName";
  v23[9] = familyName;
  phoneticFamilyName = self->_phoneticFamilyName;
  v23[10] = "phoneticFamilyName";
  v23[11] = phoneticFamilyName;
  previousFamilyName = self->_previousFamilyName;
  v23[12] = "previousFamilyName";
  v23[13] = previousFamilyName;
  organizationName = self->_organizationName;
  v23[14] = "organizationName";
  v23[15] = organizationName;
  phoneticOrganizationName = self->_phoneticOrganizationName;
  v23[16] = "phoneticOrganizationName";
  v23[17] = phoneticOrganizationName;
  nickname = self->_nickname;
  v23[18] = "nickname";
  v23[19] = nickname;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
  for (i = 0; i != 20; i += 2)
  {
    v16 = v23[i];
    v15 = (void *)v23[i + 1];
    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s=\"%@\"), v16, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v17);

    }
  }
  v18 = (void *)MEMORY[0x1E0CB3940];
  v19 = objc_opt_class();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p; %@, identifier=%llu>"),
    v19,
    self,
    v20,
    -[TISupplementalItem identifier](self, "identifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (void)setPhoneticGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (void)setPhoneticMiddleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (void)setPhoneticFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)phoneticOrganizationName
{
  return self->_phoneticOrganizationName;
}

- (void)setPhoneticOrganizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)previousFamilyName
{
  return self->_previousFamilyName;
}

- (void)setPreviousFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousFamilyName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_phoneticOrganizationName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
