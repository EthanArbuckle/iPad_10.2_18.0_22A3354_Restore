@implementation _SVXDeviceSetupOptionsMutation

- (_SVXDeviceSetupOptionsMutation)init
{
  return -[_SVXDeviceSetupOptionsMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXDeviceSetupOptionsMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXDeviceSetupOptionsMutation *v6;
  _SVXDeviceSetupOptionsMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeviceSetupOptionsMutation;
  v6 = -[_SVXDeviceSetupOptionsMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setHasActiveAccount:(int64_t)a3
{
  self->_hasActiveAccount = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void)setIsNewsRestricted:(int64_t)a3
{
  self->_isNewsRestricted = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)generate
{
  SVXDeviceSetupOptions *baseModel;
  SVXDeviceSetupOptions *v4;
  SVXDeviceSetupOptions *v5;
  NSString *v6;
  NSString *v7;
  char mutationFlags;
  int64_t gender;
  int64_t hasActiveAccount;
  int64_t isNewsRestricted;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXDeviceSetupOptions initWithLanguageCode:gender:hasActiveAccount:isNewsRestricted:]([SVXDeviceSetupOptions alloc], "initWithLanguageCode:gender:hasActiveAccount:isNewsRestricted:", self->_languageCode, self->_gender, self->_hasActiveAccount, self->_isNewsRestricted);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) != 0)
  {
    if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    {
      v6 = self->_languageCode;
    }
    else
    {
      -[SVXDeviceSetupOptions languageCode](baseModel, "languageCode");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 4) != 0)
    {
      gender = self->_gender;
      if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
      {
LABEL_11:
        hasActiveAccount = self->_hasActiveAccount;
        if ((mutationFlags & 0x10) != 0)
        {
LABEL_12:
          isNewsRestricted = self->_isNewsRestricted;
LABEL_16:
          v5 = -[SVXDeviceSetupOptions initWithLanguageCode:gender:hasActiveAccount:isNewsRestricted:]([SVXDeviceSetupOptions alloc], "initWithLanguageCode:gender:hasActiveAccount:isNewsRestricted:", v7, gender, hasActiveAccount, isNewsRestricted);

          return v5;
        }
LABEL_15:
        isNewsRestricted = -[SVXDeviceSetupOptions isNewsRestricted](self->_baseModel, "isNewsRestricted");
        goto LABEL_16;
      }
    }
    else
    {
      gender = -[SVXDeviceSetupOptions gender](self->_baseModel, "gender");
      mutationFlags = (char)self->_mutationFlags;
      if ((mutationFlags & 8) != 0)
        goto LABEL_11;
    }
    hasActiveAccount = -[SVXDeviceSetupOptions hasActiveAccount](self->_baseModel, "hasActiveAccount");
    if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
      goto LABEL_12;
    goto LABEL_15;
  }
  v4 = (SVXDeviceSetupOptions *)-[SVXDeviceSetupOptions copy](baseModel, "copy");
LABEL_5:
  v5 = v4;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
