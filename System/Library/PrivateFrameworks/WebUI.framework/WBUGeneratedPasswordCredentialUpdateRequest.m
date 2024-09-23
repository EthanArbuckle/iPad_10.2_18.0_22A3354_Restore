@implementation WBUGeneratedPasswordCredentialUpdateRequest

+ (id)requestWithNewUsername:(id)a3 newGeneratedPassword:(id)a4 lastGeneratedPassword:(id)a5 credentialURL:(id)a6 protectionSpace:(id)a7 shouldSaveNewCredential:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v8 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initRequestWithNewUsername:newGeneratedPassword:lastGeneratedPassword:credentialURL:protectionSpace:shouldSaveNewCredential:", v18, v17, v16, v15, v14, v8);

  return v19;
}

- (id)_initRequestWithNewUsername:(id)a3 newGeneratedPassword:(id)a4 lastGeneratedPassword:(id)a5 credentialURL:(id)a6 protectionSpace:(id)a7 shouldSaveNewCredential:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  WBUGeneratedPasswordCredentialUpdateRequest *v19;
  uint64_t v20;
  NSString *username;
  uint64_t v22;
  NSString *generatedPassword;
  uint64_t v24;
  NSString *lastGeneratedPassword;
  WBUGeneratedPasswordCredentialUpdateRequest *v26;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v28.receiver = self;
  v28.super_class = (Class)WBUGeneratedPasswordCredentialUpdateRequest;
  v19 = -[WBUGeneratedPasswordCredentialUpdateRequest init](&v28, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    username = v19->_username;
    v19->_username = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    generatedPassword = v19->_generatedPassword;
    v19->_generatedPassword = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    lastGeneratedPassword = v19->_lastGeneratedPassword;
    v19->_lastGeneratedPassword = (NSString *)v24;

    objc_storeStrong((id *)&v19->_urlForCredential, a6);
    objc_storeStrong((id *)&v19->_protectionSpace, a7);
    v19->_shouldSaveNewCredential = a8;
    v26 = v19;
  }

  return v19;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)generatedPassword
{
  return self->_generatedPassword;
}

- (NSString)lastGeneratedPassword
{
  return self->_lastGeneratedPassword;
}

- (NSURLProtectionSpace)protectionSpace
{
  return self->_protectionSpace;
}

- (NSURL)urlForCredential
{
  return self->_urlForCredential;
}

- (BOOL)shouldSaveNewCredential
{
  return self->_shouldSaveNewCredential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlForCredential, 0);
  objc_storeStrong((id *)&self->_protectionSpace, 0);
  objc_storeStrong((id *)&self->_lastGeneratedPassword, 0);
  objc_storeStrong((id *)&self->_generatedPassword, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
