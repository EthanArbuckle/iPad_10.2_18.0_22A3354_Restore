@implementation SSBiometricAuthenticationContext

- (SSBiometricAuthenticationContext)init
{
  SSBiometricAuthenticationContext *v2;
  SSBiometricAuthenticationContext *v3;
  NSLock *v4;
  NSLock *lock;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSBiometricAuthenticationContext;
  v2 = -[SSBiometricAuthenticationContext init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isExtendedAction = 0;
    v2->_isPayment = 0;
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v3->_lock;
    v3->_lock = v4;

  }
  return v3;
}

- (SSPaymentSheet)paymentSheet
{
  SSPaymentSheet *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_paymentSheet;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setPaymentSheet:(id)a3
{
  SSPaymentSheet *v5;

  v5 = (SSPaymentSheet *)a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_paymentSheet != v5)
    objc_storeStrong((id *)&self->_paymentSheet, a3);
  self->_isPayment = v5 != 0;
  -[NSLock unlock](self->_lock, "unlock");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSNumber copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_accountName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  *(_QWORD *)(v5 + 56) = self->_biometricAuthorizationAttempts;
  v10 = -[NSString copyWithZone:](self->_challenge, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v10;

  v12 = -[SSConsolidatedDialog copyWithZone:](self->_consolidatedDialog, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v12;

  v14 = -[NSString copyWithZone:](self->_dialogId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v14;

  *(_BYTE *)(v5 + 17) = self->_didAuthenticate;
  *(_BYTE *)(v5 + 18) = self->_didBuyParamsChange;
  *(_BYTE *)(v5 + 19) = self->_didFallbackToPassword;
  v16 = -[NSString copyWithZone:](self->_fpanID, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v16;

  *(_BYTE *)(v5 + 20) = self->_isExtendedAction;
  *(_BYTE *)(v5 + 21) = self->_isIdentityMapInvalid;
  *(_BYTE *)(v5 + 22) = self->_isPayment;
  *(_BYTE *)(v5 + 23) = self->_shouldContinueTouchIDSession;
  *(_BYTE *)(v5 + 24) = self->_shouldSendFallbackHeader;
  v18 = -[NSString copyWithZone:](self->_signature, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v18;

  *(_BYTE *)(v5 + 16) = self->_touchIDDelayEnabled;
  v20 = -[SSPaymentSheet copyWithZone:](self->_paymentSheet, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v20;

  v22 = -[SSPaymentSheet copyWithZone:](self->_paymentSheet, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v22;

  v24 = -[NSString copyWithZone:](self->_userAgent, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v24;

  v26 = -[NSString copyWithZone:](self->_xAppleAMDHeader, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v26;

  v28 = -[NSString copyWithZone:](self->_xAppleAMDMHeader, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v28;

  return (id)v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_accountIdentifier);
  SSXPCDictionarySetObject(v3, "1", self->_accountName);
  xpc_dictionary_set_int64(v3, "12", self->_biometricAuthorizationAttempts);
  SSXPCDictionarySetObject(v3, "2", self->_challenge);
  SSXPCDictionarySetObject(v3, "3", self->_consolidatedDialog);
  SSXPCDictionarySetObject(v3, "14", self->_dialogId);
  xpc_dictionary_set_BOOL(v3, "4", self->_didAuthenticate);
  xpc_dictionary_set_BOOL(v3, "5", self->_didBuyParamsChange);
  xpc_dictionary_set_BOOL(v3, "6", self->_didFallbackToPassword);
  SSXPCDictionarySetObject(v3, "21", self->_fpanID);
  xpc_dictionary_set_BOOL(v3, "19", self->_isExtendedAction);
  xpc_dictionary_set_BOOL(v3, "13", self->_isIdentityMapInvalid);
  xpc_dictionary_set_BOOL(v3, "18", self->_isPayment);
  SSXPCDictionarySetObject(v3, "7", self->_paymentSheet);
  SSXPCDictionarySetObject(v3, "20", self->_paymentTokenData);
  SSXPCDictionarySetObject(v3, "8", self->_redirectURL);
  xpc_dictionary_set_BOOL(v3, "9", self->_shouldContinueTouchIDSession);
  xpc_dictionary_set_BOOL(v3, "10", self->_shouldSendFallbackHeader);
  SSXPCDictionarySetObject(v3, "11", self->_signature);
  SSXPCDictionarySetObject(v3, "15", self->_userAgent);
  SSXPCDictionarySetObject(v3, "16", self->_xAppleAMDHeader);
  SSXPCDictionarySetObject(v3, "17", self->_xAppleAMDMHeader);
  return v3;
}

- (SSBiometricAuthenticationContext)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSBiometricAuthenticationContext *v6;
  uint64_t v8;
  uint64_t v9;
  NSNumber *accountIdentifier;
  uint64_t v11;
  uint64_t v12;
  NSString *accountName;
  uint64_t v14;
  uint64_t v15;
  NSString *challenge;
  SSConsolidatedDialog *v17;
  void *v18;
  uint64_t v19;
  SSConsolidatedDialog *consolidatedDialog;
  uint64_t v21;
  uint64_t v22;
  NSString *dialogId;
  uint64_t v24;
  uint64_t v25;
  NSString *fpanID;
  SSPaymentSheet *v27;
  void *v28;
  uint64_t v29;
  SSPaymentSheet *paymentSheet;
  uint64_t v31;
  uint64_t v32;
  NSData *paymentTokenData;
  uint64_t v34;
  uint64_t v35;
  NSURL *redirectURL;
  uint64_t v37;
  uint64_t v38;
  NSString *signature;
  uint64_t v40;
  uint64_t v41;
  NSString *userAgent;
  uint64_t v43;
  uint64_t v44;
  NSString *xAppleAMDHeader;
  uint64_t v46;
  uint64_t v47;
  NSString *xAppleAMDMHeader;
  objc_super v49;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v49.receiver = self;
    v49.super_class = (Class)SSBiometricAuthenticationContext;
    v6 = -[SSBiometricAuthenticationContext init](&v49, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      accountIdentifier = v6->_accountIdentifier;
      v6->_accountIdentifier = (NSNumber *)v9;

      v11 = objc_opt_class();
      v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      accountName = v6->_accountName;
      v6->_accountName = (NSString *)v12;

      v6->_biometricAuthorizationAttempts = xpc_dictionary_get_int64(v5, "12");
      v14 = objc_opt_class();
      v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
      challenge = v6->_challenge;
      v6->_challenge = (NSString *)v15;

      v17 = [SSConsolidatedDialog alloc];
      xpc_dictionary_get_value(v5, "3");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SSConsolidatedDialog initWithXPCEncoding:](v17, "initWithXPCEncoding:", v18);
      consolidatedDialog = v6->_consolidatedDialog;
      v6->_consolidatedDialog = (SSConsolidatedDialog *)v19;

      v21 = objc_opt_class();
      v22 = SSXPCDictionaryCopyObjectWithClass(v5, "14", v21);
      dialogId = v6->_dialogId;
      v6->_dialogId = (NSString *)v22;

      v6->_didAuthenticate = xpc_dictionary_get_BOOL(v5, "4");
      v6->_didBuyParamsChange = xpc_dictionary_get_BOOL(v5, "5");
      v6->_didFallbackToPassword = xpc_dictionary_get_BOOL(v5, "6");
      v24 = objc_opt_class();
      v25 = SSXPCDictionaryCopyObjectWithClass(v5, "21", v24);
      fpanID = v6->_fpanID;
      v6->_fpanID = (NSString *)v25;

      v6->_isExtendedAction = xpc_dictionary_get_BOOL(v5, "19");
      v6->_isIdentityMapInvalid = xpc_dictionary_get_BOOL(v5, "13");
      v6->_isPayment = xpc_dictionary_get_BOOL(v5, "18");
      v27 = [SSPaymentSheet alloc];
      xpc_dictionary_get_value(v5, "7");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[SSPaymentSheet initWithXPCEncoding:](v27, "initWithXPCEncoding:", v28);
      paymentSheet = v6->_paymentSheet;
      v6->_paymentSheet = (SSPaymentSheet *)v29;

      v31 = objc_opt_class();
      v32 = SSXPCDictionaryCopyObjectWithClass(v5, "20", v31);
      paymentTokenData = v6->_paymentTokenData;
      v6->_paymentTokenData = (NSData *)v32;

      v34 = objc_opt_class();
      v35 = SSXPCDictionaryCopyObjectWithClass(v5, "8", v34);
      redirectURL = v6->_redirectURL;
      v6->_redirectURL = (NSURL *)v35;

      v6->_shouldContinueTouchIDSession = xpc_dictionary_get_BOOL(v5, "9");
      v6->_shouldSendFallbackHeader = xpc_dictionary_get_BOOL(v5, "10");
      v37 = objc_opt_class();
      v38 = SSXPCDictionaryCopyObjectWithClass(v5, "11", v37);
      signature = v6->_signature;
      v6->_signature = (NSString *)v38;

      v40 = objc_opt_class();
      v41 = SSXPCDictionaryCopyObjectWithClass(v5, "15", v40);
      userAgent = v6->_userAgent;
      v6->_userAgent = (NSString *)v41;

      v43 = objc_opt_class();
      v44 = SSXPCDictionaryCopyObjectWithClass(v5, "16", v43);
      xAppleAMDHeader = v6->_xAppleAMDHeader;
      v6->_xAppleAMDHeader = (NSString *)v44;

      v46 = objc_opt_class();
      v47 = SSXPCDictionaryCopyObjectWithClass(v5, "17", v46);
      xAppleAMDMHeader = v6->_xAppleAMDMHeader;
      v6->_xAppleAMDMHeader = (NSString *)v47;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)accountName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccountName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (int64_t)biometricAuthorizationAttempts
{
  return self->_biometricAuthorizationAttempts;
}

- (void)setBiometricAuthorizationAttempts:(int64_t)a3
{
  self->_biometricAuthorizationAttempts = a3;
}

- (NSString)challenge
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setChallenge:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)touchIDDelayEnabled
{
  return self->_touchIDDelayEnabled;
}

- (void)setTouchIDDelayEnabled:(BOOL)a3
{
  self->_touchIDDelayEnabled = a3;
}

- (SSConsolidatedDialog)consolidatedDialog
{
  return (SSConsolidatedDialog *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConsolidatedDialog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)dialogId
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDialogId:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (BOOL)didAuthenticate
{
  return self->_didAuthenticate;
}

- (void)setDidAuthenticate:(BOOL)a3
{
  self->_didAuthenticate = a3;
}

- (BOOL)didBuyParamsChange
{
  return self->_didBuyParamsChange;
}

- (void)setDidBuyParamsChange:(BOOL)a3
{
  self->_didBuyParamsChange = a3;
}

- (BOOL)didFallbackToPassword
{
  return self->_didFallbackToPassword;
}

- (void)setDidFallbackToPassword:(BOOL)a3
{
  self->_didFallbackToPassword = a3;
}

- (NSString)fpanID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFpanID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (BOOL)isExtendedAction
{
  return self->_isExtendedAction;
}

- (void)setIsExtendedAction:(BOOL)a3
{
  self->_isExtendedAction = a3;
}

- (BOOL)isIdentityMapInvalid
{
  return self->_isIdentityMapInvalid;
}

- (void)setIsIdentityMapInvalid:(BOOL)a3
{
  self->_isIdentityMapInvalid = a3;
}

- (BOOL)isPayment
{
  return self->_isPayment;
}

- (void)setIsPayment:(BOOL)a3
{
  self->_isPayment = a3;
}

- (NSString)passwordEquivalentToken
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPasswordEquivalentToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSData)paymentTokenData
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPaymentTokenData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSURL)redirectURL
{
  return (NSURL *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRedirectURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (BOOL)shouldContinueTouchIDSession
{
  return self->_shouldContinueTouchIDSession;
}

- (void)setShouldContinueTouchIDSession:(BOOL)a3
{
  self->_shouldContinueTouchIDSession = a3;
}

- (BOOL)shouldSendFallbackHeader
{
  return self->_shouldSendFallbackHeader;
}

- (void)setShouldSendFallbackHeader:(BOOL)a3
{
  self->_shouldSendFallbackHeader = a3;
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSString)xAppleAMDHeader
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setXAppleAMDHeader:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSString)xAppleAMDMHeader
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setXAppleAMDMHeader:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xAppleAMDMHeader, 0);
  objc_storeStrong((id *)&self->_xAppleAMDHeader, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_paymentTokenData, 0);
  objc_storeStrong((id *)&self->_passwordEquivalentToken, 0);
  objc_storeStrong((id *)&self->_fpanID, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
  objc_storeStrong((id *)&self->_consolidatedDialog, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentSheet, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
