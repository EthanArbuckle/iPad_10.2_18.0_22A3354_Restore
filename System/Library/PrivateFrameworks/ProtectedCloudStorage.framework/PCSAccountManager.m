@implementation PCSAccountManager

- (PCSAccountManager)initWithDSID:(id)a3
{
  id v5;
  PCSAccountManager *v6;
  PCSAccountManager *v7;
  PCSAccountManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PCSAccountManager;
  v6 = -[PCSAccountManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dsid, a3);
    v8 = v7;
  }

  return v7;
}

- (unint64_t)accountStatus
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  const __CFDictionary *v6;
  CFTypeRef v7;
  const void *v8;
  unint64_t IsICDP;
  const void *v11;
  __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[PCSAccountManager dsid](self, "dsid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PCSCurrentPersonaMatchesDSID(v3);

  if (v4)
  {
    v12 = kPCSSetupDSID[0];
    -[PCSAccountManager dsid](self, "dsid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v7 = PCSIdentitySetCreate(v6, 0, &v11);
    if (v7)
    {
      v8 = v7;
      IsICDP = PCSIdentitySetIsICDP((uint64_t)v7, 0);
    }
    else
    {
      v8 = v11;
      if (!v11)
      {
        IsICDP = 1;
        goto LABEL_8;
      }
      v11 = 0;
      IsICDP = 1;
    }
    CFRelease(v8);
LABEL_8:

    return IsICDP;
  }
  return 2;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDsid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
