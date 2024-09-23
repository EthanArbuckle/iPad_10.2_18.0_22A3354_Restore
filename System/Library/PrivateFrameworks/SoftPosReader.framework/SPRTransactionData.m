@implementation SPRTransactionData

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v7;
  NSData *transactionCipherBlob;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  NSData *errorIndicationStatusWord;
  __CFString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  void *v52;
  uint64_t cvmType;
  uint64_t errorIndicationMsgOnError;
  uint64_t outcomeStatus;
  NSString *network;
  void *v58;
  __CFString *v59;

  if (objc_msgSend_length(self->_transactionCipherBlob, a2, v2, v3, v4, v5))
    v7 = CFSTR("present");
  else
    v7 = &stru_24D3CDE20;
  transactionCipherBlob = self->_transactionCipherBlob;
  v59 = v7;
  if (objc_msgSend_length(transactionCipherBlob, v9, v10, v11, v12, v13))
    v14 = CFSTR("present");
  else
    v14 = &stru_24D3CDE20;
  outcomeStatus = self->_outcomeStatus;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  network = self->_network;
  v58 = (void *)MEMORY[0x24BDD17C8];
  v16 = v14;
  objc_msgSend_asHexString(errorIndicationStatusWord, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  errorIndicationMsgOnError = self->_errorIndicationMsgOnError;
  cvmType = self->_cvmType;
  objc_msgSend_asHexString(self->_cvmResult, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asHexString(self->_merchantCategoryCode, v29, v30, v31, v32, v33);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_pinRequired)
    v40 = CFSTR("true");
  else
    v40 = CFSTR("false");
  if (self->_isPinSupported)
    v41 = CFSTR("true");
  else
    v41 = CFSTR("false");
  objc_msgSend_asHexString(self->_languagePreference, v34, v35, v36, v37, v38);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isPINBypassEnabled)
    v47 = CFSTR("true");
  else
    v47 = CFSTR("false");
  if (self->_isPINBypassAllowed)
    v48 = CFSTR("true");
  else
    v48 = CFSTR("false");
  if (self->_forFallback)
    v49 = CFSTR("true");
  else
    v49 = CFSTR("false");
  if (self->_switchInterfaceOrNoCVMSuccess)
    v50 = CFSTR("true");
  else
    v50 = CFSTR("false");
  if (self->_isSAF)
    v51 = CFSTR("true");
  else
    v51 = CFSTR("false");
  objc_msgSend_stringWithFormat_(v58, v42, (uint64_t)CFSTR("{vasResponses: see earlier log, transactionCipherBlob: %@, transactionKeyBlob: %@, network(50): %@, outcomeStatus: 0x%02X, errorIndicationStatusWord: %@, errorIndicationMsgOnError: 0x%02X, cvmType: 0x%02X, cvmResult(9F34): %@, merchantCategoryCode(9F15): %@, pinRequired: %@, transactionResultData(DF81FE): see earlier log, isPinSupported: %@, languagePreference(5F2D): %@, readError: %ld, payAppletFinalStatus: 0x%02X, isPINBypassEnabled: %@, isPINBypassAllowed: %@, forFallback: %@, fallbackAmount: %@, switchInterfaceOrNoCVMSuccess: %@, cardExpirationState: 0x%02X, cardEffectiveState: 0x%02X, payAppType: %@, isSAF: %@}"), v43, v44, v45, v59, v16, network, outcomeStatus, v22, errorIndicationMsgOnError, cvmType, v28, v39, v40, v41, v46, self->_readError,
    self->_payAppletFinalStatus,
    v47,
    v48,
    v49,
    self->_fallbackAmount,
    v50,
    self->_cardExpirationState,
    self->_cardEffectiveState,
    self->_payAppType,
    v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (id)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;

  if (objc_msgSend_count(self->_vasResponses, a2, v2, v3, v4, v5))
  {
    objc_msgSend_componentsJoinedByString_(self->_vasResponses, v7, (uint64_t)CFSTR(" "), v9, v10, v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &stru_24D3CDE20;
  }
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_asHexString(self->_transactionCipherBlob, v7, v8, v9, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asHexString(self->_transactionKeyBlob, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asHexString(self->_kernelIdentityKeyAttestation, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asHexString(self->_ecdsaCertificate, v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asHexString(self->_transactionResultData, v33, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v13, v39, (uint64_t)CFSTR("{vasResponses=%@, transactionCipherBlob=%@, transactionKeyBlob=%@, kernelIdentityKeyAttestation=%@, ecdsaCertificate=%@, transactionResultData(DF81FE)=%@, kekId=%@, pinKekId=%@, transactionId=%@}"), v40, v41, v42, v12, v14, v20, v26, v32, v38, self->_kekId, self->_pinKekId, self->_transactionId);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (NSData)fingerprint
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CC_LONG v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CC_LONG v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CC_LONG v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  CC_LONG v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned __int8 *v67;
  CC_SHA256_CTX v69;

  objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], a2, 32, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(self->_transactionId, v7, 4, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v69, 0, sizeof(v69));
  CC_SHA256_Init(&v69);
  v17 = (const void *)objc_msgSend_bytes(self->_transactionCipherBlob, v12, v13, v14, v15, v16);
  v23 = objc_msgSend_length(self->_transactionCipherBlob, v18, v19, v20, v21, v22);
  CC_SHA256_Update(&v69, v17, v23);
  v29 = (const void *)objc_msgSend_bytes(self->_transactionKeyBlob, v24, v25, v26, v27, v28);
  v35 = objc_msgSend_length(self->_transactionKeyBlob, v30, v31, v32, v33, v34);
  CC_SHA256_Update(&v69, v29, v35);
  v41 = (const void *)objc_msgSend_bytes(self->_cvmResult, v36, v37, v38, v39, v40);
  v47 = objc_msgSend_length(self->_cvmResult, v42, v43, v44, v45, v46);
  CC_SHA256_Update(&v69, v41, v47);
  v48 = objc_retainAutorelease(v11);
  v54 = (const void *)objc_msgSend_bytes(v48, v49, v50, v51, v52, v53);
  v60 = objc_msgSend_length(v48, v55, v56, v57, v58, v59);
  CC_SHA256_Update(&v69, v54, v60);
  v61 = objc_retainAutorelease(v6);
  v67 = (unsigned __int8 *)objc_msgSend_mutableBytes(v61, v62, v63, v64, v65, v66);
  CC_SHA256_Final(v67, &v69);

  return (NSData *)v61;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassEnabled:(BOOL)a24 isPINBypassAllowed:(BOOL)a25 forFallback:(BOOL)a26 fallbackAmount:(id)a27 switchInterfaceOrNoCVMSuccess:(BOOL)a28 cardExpirationState:(unsigned __int8)a29 cardEffectiveState:(unsigned __int8)a30 payAppType:(id)a31 isSAF:(BOOL)a32
{
  NSArray *v36;
  NSData *v37;
  NSData *v38;
  NSString *v39;
  NSData *v40;
  NSString *v41;
  NSString *v42;
  NSData *v43;
  NSArray *vasResponses;
  NSData *cardHolderData;
  NSData *transactionCipherBlob;
  NSData *transactionKeyBlob;
  NSString *network;
  NSData *errorIndicationStatusWord;
  NSData *cvmResult;
  NSData *merchantCategoryCode;
  NSData *kernelIdentityKeyAttestation;
  NSData *v53;
  NSData *ecdsaCertificate;
  NSData *v55;
  NSData *transactionResultData;
  NSData *v57;
  NSString *kekId;
  NSString *v59;
  NSString *pinKekId;
  NSString *v61;
  NSData *languagePreference;
  NSData *v63;
  NSString *transactionId;
  NSString *v65;
  NSString *fallbackAmount;
  NSString *v67;
  NSString *payAppType;
  NSData *v70;
  NSData *v71;
  NSData *v72;
  NSData *v73;
  NSData *v74;
  NSData *v75;
  NSData *v76;
  NSString *v78;
  NSData *v80;
  NSString *v81;
  NSString *v82;
  NSString *v83;
  NSData *v84;
  NSData *v85;
  NSArray *v86;

  v36 = (NSArray *)a3;
  v37 = (NSData *)a4;
  v38 = (NSData *)a5;
  v39 = (NSString *)a6;
  v70 = (NSData *)a8;
  v71 = (NSData *)a11;
  v72 = (NSData *)a12;
  v73 = (NSData *)a14;
  v40 = (NSData *)a15;
  v74 = (NSData *)a16;
  v41 = (NSString *)a17;
  v42 = (NSString *)a18;
  v43 = (NSData *)a20;
  v78 = (NSString *)a21;
  v81 = (NSString *)a27;
  v82 = (NSString *)a31;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v36;
  v86 = v36;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = 0;

  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = v37;
  v85 = v37;

  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = v38;
  v84 = v38;

  network = self->_network;
  self->_network = v39;
  v83 = v39;

  self->_outcomeStatus = a7;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v70;
  v80 = v70;

  self->_errorIndicationMsgOnError = a9;
  self->_cvmType = a10;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v71;
  v76 = v71;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v72;
  v75 = v72;

  self->_pinRequired = a13;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v73;
  v53 = v73;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v40;
  v55 = v40;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v74;
  v57 = v74;

  kekId = self->_kekId;
  self->_kekId = v41;
  v59 = v41;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v42;
  v61 = v42;

  self->_isPinSupported = a19;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v43;
  v63 = v43;

  transactionId = self->_transactionId;
  self->_transactionId = v78;
  v65 = v78;

  self->_payAppletFinalStatus = a23;
  self->_isPINBypassEnabled = a24;
  self->_isPINBypassAllowed = a25;
  self->_forFallback = a26;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a22;
  self->_fallbackAmount = v81;
  v67 = v81;

  self->_switchInterfaceOrNoCVMSuccess = a28;
  self->_cardExpirationState = a29;
  self->_cardEffectiveState = a30;
  payAppType = self->_payAppType;
  self->_payAppType = v82;

  self->_isSAF = a32;
  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 cardHolderData:(id)a4 network:(id)a5 outcomeStatus:(unsigned __int8)a6 cvmType:(unsigned __int8)a7 cvmResult:(id)a8 merchantCategoryCode:(id)a9 pinRequired:(BOOL)a10 kernelIdentityKeyAttestation:(id)a11 ecdsaCertificate:(id)a12 transactionResultData:(id)a13 kekId:(id)a14 pinKekId:(id)a15 isPinSupported:(BOOL)a16 languagePreference:(id)a17 transactionId:(id)a18 readError:(int64_t)a19 payAppletFinalStatus:(unsigned __int8)a20
{
  NSArray *v24;
  NSData *v25;
  NSString *v26;
  NSData *v27;
  NSData *v28;
  NSData *v29;
  NSData *v30;
  NSData *v31;
  NSArray *vasResponses;
  NSData *cardHolderData;
  NSString *network;
  NSData *cvmResult;
  NSData *merchantCategoryCode;
  NSData *v37;
  NSData *kernelIdentityKeyAttestation;
  NSData *v39;
  NSData *ecdsaCertificate;
  NSData *v41;
  NSData *transactionResultData;
  NSData *v43;
  NSString *kekId;
  NSString *v45;
  NSString *pinKekId;
  NSString *v47;
  NSData *languagePreference;
  NSData *v49;
  NSString *transactionId;
  NSString *v51;
  NSString *fallbackAmount;
  NSString *v54;
  NSString *v56;
  NSData *v57;
  NSString *v58;
  NSData *v60;
  NSString *v61;
  NSData *v62;
  NSArray *v63;

  v24 = (NSArray *)a3;
  v25 = (NSData *)a4;
  v26 = (NSString *)a5;
  v27 = (NSData *)a8;
  v28 = (NSData *)a9;
  v29 = (NSData *)a11;
  v30 = (NSData *)a12;
  v31 = (NSData *)a13;
  v54 = (NSString *)a14;
  v56 = (NSString *)a15;
  v57 = (NSData *)a17;
  v58 = (NSString *)a18;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v24;
  v63 = v24;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = v25;
  v62 = v25;

  network = self->_network;
  self->_network = v26;
  v61 = v26;

  self->_outcomeStatus = a6;
  self->_cvmType = a7;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v27;
  v60 = v27;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v28;
  v37 = v28;

  self->_pinRequired = a10;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v29;
  v39 = v29;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v30;
  v41 = v30;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v31;
  v43 = v31;

  kekId = self->_kekId;
  self->_kekId = v54;
  v45 = v54;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v56;
  v47 = v56;

  self->_isPinSupported = a16;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v57;
  v49 = v57;

  transactionId = self->_transactionId;
  self->_transactionId = v58;
  v51 = v58;

  self->_payAppletFinalStatus = a20;
  *(_WORD *)&self->_isPINBypassAllowed = 0;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a19;
  self->_fallbackAmount = (NSString *)CFSTR("000000000000");

  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 cardHolderData:(id)a4 network:(id)a5 outcomeStatus:(unsigned __int8)a6 cvmType:(unsigned __int8)a7 cvmResult:(id)a8 merchantCategoryCode:(id)a9 pinRequired:(BOOL)a10 kernelIdentityKeyAttestation:(id)a11 ecdsaCertificate:(id)a12 transactionResultData:(id)a13 kekId:(id)a14 pinKekId:(id)a15 isPinSupported:(BOOL)a16 languagePreference:(id)a17 transactionId:(id)a18 readError:(int64_t)a19 payAppletFinalStatus:(unsigned __int8)a20 isPINBypassAllowed:(BOOL)a21 forFallback:(BOOL)a22 fallbackAmount:(id)a23
{
  NSArray *v27;
  NSData *v28;
  NSString *v29;
  NSData *v30;
  NSData *v31;
  NSData *v32;
  NSString *v33;
  NSData *v34;
  NSArray *vasResponses;
  NSData *cardHolderData;
  NSString *network;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSData *v42;
  NSData *errorIndicationStatusWord;
  NSData *cvmResult;
  NSData *merchantCategoryCode;
  NSData *v46;
  NSData *kernelIdentityKeyAttestation;
  NSData *v48;
  NSData *ecdsaCertificate;
  NSData *v50;
  NSData *transactionResultData;
  NSData *v52;
  NSString *kekId;
  NSString *v54;
  NSString *pinKekId;
  NSString *v56;
  NSData *languagePreference;
  NSData *v58;
  NSString *transactionId;
  NSString *v60;
  NSString *fallbackAmount;
  NSData *v63;
  NSData *v65;
  NSString *v66;
  NSData *v68;
  NSString *v69;
  NSString *v70;
  NSString *v71;
  NSData *v72;
  NSArray *v73;

  v27 = (NSArray *)a3;
  v28 = (NSData *)a4;
  v29 = (NSString *)a5;
  v30 = (NSData *)a8;
  v31 = (NSData *)a9;
  v32 = (NSData *)a11;
  v63 = (NSData *)a12;
  v65 = (NSData *)a13;
  v66 = (NSString *)a14;
  v33 = (NSString *)a15;
  v34 = (NSData *)a17;
  v69 = (NSString *)a18;
  v70 = (NSString *)a23;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v27;
  v73 = v27;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = v28;
  v72 = v28;

  network = self->_network;
  self->_network = v29;
  v71 = v29;

  self->_outcomeStatus = a6;
  objc_msgSend_dataWithHexString_(MEMORY[0x24BDBCE50], v38, (uint64_t)CFSTR("0000"), v39, v40, v41);
  v42 = (NSData *)objc_claimAutoreleasedReturnValue();
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v42;

  self->_errorIndicationMsgOnError = 0;
  self->_cvmType = a7;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v30;
  v68 = v30;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v31;
  v46 = v31;

  self->_pinRequired = a10;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v32;
  v48 = v32;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v63;
  v50 = v63;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v65;
  v52 = v65;

  kekId = self->_kekId;
  self->_kekId = v66;
  v54 = v66;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v33;
  v56 = v33;

  self->_isPinSupported = a16;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v34;
  v58 = v34;

  transactionId = self->_transactionId;
  self->_transactionId = v69;
  v60 = v69;

  self->_payAppletFinalStatus = a20;
  self->_isPINBypassAllowed = a21;
  self->_forFallback = a22;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a19;
  self->_fallbackAmount = v70;

  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 cardHolderData:(id)a4 network:(id)a5 outcomeStatus:(unsigned __int8)a6 errorIndicationStatusWord:(id)a7 errorIndicationMsgOnError:(unsigned __int8)a8 cvmType:(unsigned __int8)a9 cvmResult:(id)a10 merchantCategoryCode:(id)a11 pinRequired:(BOOL)a12 kernelIdentityKeyAttestation:(id)a13 ecdsaCertificate:(id)a14 transactionResultData:(id)a15 kekId:(id)a16 pinKekId:(id)a17 isPinSupported:(BOOL)a18 languagePreference:(id)a19 transactionId:(id)a20 readError:(int64_t)a21 payAppletFinalStatus:(unsigned __int8)a22 isPINBypassAllowed:(BOOL)a23 forFallback:(BOOL)a24 fallbackAmount:(id)a25
{
  NSArray *v29;
  NSData *v30;
  NSString *v31;
  NSData *v32;
  NSData *v33;
  NSData *v34;
  NSData *v35;
  NSArray *vasResponses;
  NSData *cardHolderData;
  NSString *network;
  NSData *errorIndicationStatusWord;
  NSData *cvmResult;
  NSData *merchantCategoryCode;
  NSData *v42;
  NSData *kernelIdentityKeyAttestation;
  NSData *v44;
  NSData *ecdsaCertificate;
  NSData *v46;
  NSData *transactionResultData;
  NSData *v48;
  NSString *kekId;
  NSString *v50;
  NSString *pinKekId;
  NSString *v52;
  NSData *languagePreference;
  NSData *v54;
  NSString *transactionId;
  NSString *v56;
  NSString *fallbackAmount;
  NSData *v59;
  NSData *v60;
  NSString *v61;
  NSString *v62;
  NSData *v63;
  NSData *v65;
  NSString *v66;
  NSString *v67;
  NSData *v69;
  NSString *v70;
  NSData *v71;
  NSArray *v72;

  v29 = (NSArray *)a3;
  v30 = (NSData *)a4;
  v31 = (NSString *)a5;
  v32 = (NSData *)a7;
  v33 = (NSData *)a10;
  v34 = (NSData *)a11;
  v35 = (NSData *)a13;
  v59 = (NSData *)a14;
  v60 = (NSData *)a15;
  v61 = (NSString *)a16;
  v62 = (NSString *)a17;
  v63 = (NSData *)a19;
  v66 = (NSString *)a20;
  v67 = (NSString *)a25;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v29;
  v72 = v29;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = v30;
  v71 = v30;

  network = self->_network;
  self->_network = v31;
  v70 = v31;

  self->_outcomeStatus = a6;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v32;
  v69 = v32;

  self->_errorIndicationMsgOnError = a8;
  self->_cvmType = a9;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v33;
  v65 = v33;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v34;
  v42 = v34;

  self->_pinRequired = a12;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v35;
  v44 = v35;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v59;
  v46 = v59;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v60;
  v48 = v60;

  kekId = self->_kekId;
  self->_kekId = v61;
  v50 = v61;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v62;
  v52 = v62;

  self->_isPinSupported = a18;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v63;
  v54 = v63;

  transactionId = self->_transactionId;
  self->_transactionId = v66;
  v56 = v66;

  self->_payAppletFinalStatus = a22;
  self->_isPINBypassAllowed = a23;
  self->_forFallback = a24;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a21;
  self->_fallbackAmount = v67;

  self->_switchInterfaceOrNoCVMSuccess = 0;
  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 cardHolderData:(id)a4 network:(id)a5 outcomeStatus:(unsigned __int8)a6 errorIndicationStatusWord:(id)a7 errorIndicationMsgOnError:(unsigned __int8)a8 cvmType:(unsigned __int8)a9 cvmResult:(id)a10 merchantCategoryCode:(id)a11 pinRequired:(BOOL)a12 kernelIdentityKeyAttestation:(id)a13 ecdsaCertificate:(id)a14 transactionResultData:(id)a15 kekId:(id)a16 pinKekId:(id)a17 isPinSupported:(BOOL)a18 languagePreference:(id)a19 transactionId:(id)a20 readError:(int64_t)a21 payAppletFinalStatus:(unsigned __int8)a22 isPINBypassAllowed:(BOOL)a23 forFallback:(BOOL)a24 fallbackAmount:(id)a25 switchInterfaceOrNoCVMSuccess:(BOOL)a26
{
  NSArray *v30;
  NSData *v31;
  NSString *v32;
  NSData *v33;
  NSData *v34;
  NSData *v35;
  NSString *v36;
  NSData *v37;
  NSArray *vasResponses;
  NSData *cardHolderData;
  NSData *transactionCipherBlob;
  NSData *transactionKeyBlob;
  NSString *network;
  NSData *errorIndicationStatusWord;
  NSData *cvmResult;
  NSData *merchantCategoryCode;
  NSData *v46;
  NSData *kernelIdentityKeyAttestation;
  NSData *v48;
  NSData *ecdsaCertificate;
  NSData *v50;
  NSData *transactionResultData;
  NSData *v52;
  NSString *kekId;
  NSString *v54;
  NSString *pinKekId;
  NSString *v56;
  NSData *languagePreference;
  NSData *v58;
  NSString *transactionId;
  NSString *v60;
  NSString *fallbackAmount;
  NSData *v63;
  NSData *v64;
  NSData *v65;
  NSString *v66;
  NSData *v68;
  NSData *v70;
  NSString *v71;
  NSString *v72;
  NSString *v73;
  NSData *v74;
  NSArray *v75;

  v30 = (NSArray *)a3;
  v31 = (NSData *)a4;
  v32 = (NSString *)a5;
  v33 = (NSData *)a7;
  v34 = (NSData *)a10;
  v63 = (NSData *)a11;
  v35 = (NSData *)a13;
  v64 = (NSData *)a14;
  v65 = (NSData *)a15;
  v36 = (NSString *)a16;
  v66 = (NSString *)a17;
  v37 = (NSData *)a19;
  v71 = (NSString *)a20;
  v72 = (NSString *)a25;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v30;
  v75 = v30;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = v31;
  v74 = v31;

  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = 0;

  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = 0;

  network = self->_network;
  self->_network = v32;
  v73 = v32;

  self->_outcomeStatus = a6;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v33;
  v70 = v33;

  self->_errorIndicationMsgOnError = a8;
  self->_cvmType = a9;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v34;
  v68 = v34;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v63;
  v46 = v63;

  self->_pinRequired = a12;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v35;
  v48 = v35;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v64;
  v50 = v64;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v65;
  v52 = v65;

  kekId = self->_kekId;
  self->_kekId = v36;
  v54 = v36;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v66;
  v56 = v66;

  self->_isPinSupported = a18;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v37;
  v58 = v37;

  transactionId = self->_transactionId;
  self->_transactionId = v71;
  v60 = v71;

  self->_payAppletFinalStatus = a22;
  self->_isPINBypassAllowed = a23;
  self->_forFallback = a24;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a21;
  self->_fallbackAmount = v72;

  self->_switchInterfaceOrNoCVMSuccess = a26;
  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassAllowed:(BOOL)a24 forFallback:(BOOL)a25 fallbackAmount:(id)a26 switchInterfaceOrNoCVMSuccess:(BOOL)a27
{
  NSArray *v32;
  NSData *v33;
  NSData *v34;
  NSString *v35;
  NSData *v36;
  NSString *v37;
  NSString *v38;
  NSArray *vasResponses;
  NSData *cardHolderData;
  NSData *transactionCipherBlob;
  NSData *transactionKeyBlob;
  NSString *network;
  NSData *errorIndicationStatusWord;
  NSData *cvmResult;
  NSData *merchantCategoryCode;
  NSData *v47;
  NSData *kernelIdentityKeyAttestation;
  NSData *v49;
  NSData *ecdsaCertificate;
  NSData *v51;
  NSData *transactionResultData;
  NSData *v53;
  NSString *kekId;
  NSString *v55;
  NSString *pinKekId;
  NSString *v57;
  NSData *languagePreference;
  NSData *v59;
  NSString *transactionId;
  NSString *v61;
  NSString *fallbackAmount;
  NSData *v64;
  NSData *v65;
  NSData *v66;
  NSData *v67;
  NSData *v68;
  NSData *v69;
  NSData *v70;
  NSData *v72;
  NSString *v73;
  NSString *v74;
  NSString *v75;
  NSData *v76;
  NSData *v77;
  NSArray *v78;

  v32 = (NSArray *)a3;
  v33 = (NSData *)a4;
  v34 = (NSData *)a5;
  v35 = (NSString *)a6;
  v36 = (NSData *)a8;
  v64 = (NSData *)a11;
  v65 = (NSData *)a12;
  v66 = (NSData *)a14;
  v67 = (NSData *)a15;
  v68 = (NSData *)a16;
  v37 = (NSString *)a17;
  v38 = (NSString *)a18;
  v70 = (NSData *)a20;
  v73 = (NSString *)a21;
  v74 = (NSString *)a26;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v32;
  v78 = v32;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = 0;

  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = v33;
  v77 = v33;

  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = v34;
  v76 = v34;

  network = self->_network;
  self->_network = v35;
  v75 = v35;

  self->_outcomeStatus = a7;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v36;
  v72 = v36;

  self->_errorIndicationMsgOnError = a9;
  self->_cvmType = a10;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v64;
  v69 = v64;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v65;
  v47 = v65;

  self->_pinRequired = a13;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v66;
  v49 = v66;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v67;
  v51 = v67;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v68;
  v53 = v68;

  kekId = self->_kekId;
  self->_kekId = v37;
  v55 = v37;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v38;
  v57 = v38;

  self->_isPinSupported = a19;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v70;
  v59 = v70;

  transactionId = self->_transactionId;
  self->_transactionId = v73;
  v61 = v73;

  *(_WORD *)&self->_payAppletFinalStatus = a23;
  self->_isPINBypassAllowed = a24;
  self->_forFallback = a25;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a22;
  self->_fallbackAmount = v74;

  self->_switchInterfaceOrNoCVMSuccess = a27;
  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassEnabled:(BOOL)a24 isPINBypassAllowed:(BOOL)a25 forFallback:(BOOL)a26 fallbackAmount:(id)a27 switchInterfaceOrNoCVMSuccess:(BOOL)a28
{
  NSArray *v33;
  NSData *v34;
  NSData *v35;
  NSString *v36;
  NSData *v37;
  NSString *v38;
  NSString *v39;
  NSArray *vasResponses;
  NSData *cardHolderData;
  NSData *transactionCipherBlob;
  NSData *transactionKeyBlob;
  NSString *network;
  NSData *errorIndicationStatusWord;
  NSData *cvmResult;
  NSData *merchantCategoryCode;
  NSData *v48;
  NSData *kernelIdentityKeyAttestation;
  NSData *v50;
  NSData *ecdsaCertificate;
  NSData *v52;
  NSData *transactionResultData;
  NSData *v54;
  NSString *kekId;
  NSString *v56;
  NSString *pinKekId;
  NSString *v58;
  NSData *languagePreference;
  NSData *v60;
  NSString *transactionId;
  NSString *v62;
  NSString *fallbackAmount;
  NSData *v65;
  NSData *v66;
  NSData *v67;
  NSData *v68;
  NSData *v69;
  NSData *v70;
  NSData *v71;
  NSData *v73;
  NSString *v74;
  NSString *v75;
  NSString *v76;
  NSData *v77;
  NSData *v78;
  NSArray *v79;

  v33 = (NSArray *)a3;
  v34 = (NSData *)a4;
  v35 = (NSData *)a5;
  v36 = (NSString *)a6;
  v37 = (NSData *)a8;
  v65 = (NSData *)a11;
  v66 = (NSData *)a12;
  v67 = (NSData *)a14;
  v68 = (NSData *)a15;
  v69 = (NSData *)a16;
  v38 = (NSString *)a17;
  v39 = (NSString *)a18;
  v71 = (NSData *)a20;
  v74 = (NSString *)a21;
  v75 = (NSString *)a27;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v33;
  v79 = v33;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = 0;

  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = v34;
  v78 = v34;

  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = v35;
  v77 = v35;

  network = self->_network;
  self->_network = v36;
  v76 = v36;

  self->_outcomeStatus = a7;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v37;
  v73 = v37;

  self->_errorIndicationMsgOnError = a9;
  self->_cvmType = a10;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v65;
  v70 = v65;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v66;
  v48 = v66;

  self->_pinRequired = a13;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v67;
  v50 = v67;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v68;
  v52 = v68;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v69;
  v54 = v69;

  kekId = self->_kekId;
  self->_kekId = v38;
  v56 = v38;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v39;
  v58 = v39;

  self->_isPinSupported = a19;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v71;
  v60 = v71;

  transactionId = self->_transactionId;
  self->_transactionId = v74;
  v62 = v74;

  *(_WORD *)&self->_payAppletFinalStatus = a23;
  self->_isPINBypassAllowed = a25;
  self->_forFallback = a26;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a22;
  self->_fallbackAmount = v75;

  self->_switchInterfaceOrNoCVMSuccess = a28;
  *(_WORD *)&self->_cardExpirationState = 0;
  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassEnabled:(BOOL)a24 isPINBypassAllowed:(BOOL)a25 forFallback:(BOOL)a26 fallbackAmount:(id)a27 switchInterfaceOrNoCVMSuccess:(BOOL)a28 cardExpirationState:(unsigned __int8)a29 cardEffectiveState:(unsigned __int8)a30
{
  NSArray *v35;
  NSData *v36;
  NSData *v37;
  NSString *v38;
  NSData *v39;
  NSString *v40;
  NSString *v41;
  NSData *v42;
  NSArray *vasResponses;
  NSData *cardHolderData;
  NSData *transactionCipherBlob;
  NSData *transactionKeyBlob;
  NSString *network;
  NSData *errorIndicationStatusWord;
  NSData *cvmResult;
  NSData *merchantCategoryCode;
  NSData *kernelIdentityKeyAttestation;
  NSData *v52;
  NSData *ecdsaCertificate;
  NSData *v54;
  NSData *transactionResultData;
  NSData *v56;
  NSString *kekId;
  NSString *v58;
  NSString *pinKekId;
  NSString *v60;
  NSData *languagePreference;
  NSData *v62;
  NSString *transactionId;
  NSString *v64;
  NSString *fallbackAmount;
  NSString *v66;
  NSString *payAppType;
  NSData *v69;
  NSData *v70;
  NSData *v71;
  NSData *v72;
  NSData *v73;
  NSData *v74;
  NSData *v75;
  NSString *v76;
  NSString *v77;
  NSData *v79;
  NSString *v80;
  NSData *v81;
  NSData *v82;
  NSArray *v83;

  v35 = (NSArray *)a3;
  v36 = (NSData *)a4;
  v37 = (NSData *)a5;
  v38 = (NSString *)a6;
  v39 = (NSData *)a8;
  v69 = (NSData *)a11;
  v70 = (NSData *)a12;
  v71 = (NSData *)a14;
  v72 = (NSData *)a15;
  v73 = (NSData *)a16;
  v40 = (NSString *)a17;
  v41 = (NSString *)a18;
  v42 = (NSData *)a20;
  v76 = (NSString *)a21;
  v77 = (NSString *)a27;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v35;
  v83 = v35;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = 0;

  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = v36;
  v82 = v36;

  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = v37;
  v81 = v37;

  network = self->_network;
  self->_network = v38;
  v80 = v38;

  self->_outcomeStatus = a7;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v39;
  v79 = v39;

  self->_errorIndicationMsgOnError = a9;
  self->_cvmType = a10;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v69;
  v75 = v69;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v70;
  v74 = v70;

  self->_pinRequired = a13;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v71;
  v52 = v71;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v72;
  v54 = v72;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v73;
  v56 = v73;

  kekId = self->_kekId;
  self->_kekId = v40;
  v58 = v40;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v41;
  v60 = v41;

  self->_isPinSupported = a19;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v42;
  v62 = v42;

  transactionId = self->_transactionId;
  self->_transactionId = v76;
  v64 = v76;

  self->_payAppletFinalStatus = a23;
  self->_isPINBypassEnabled = a24;
  self->_isPINBypassAllowed = a25;
  self->_forFallback = a26;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a22;
  self->_fallbackAmount = v77;
  v66 = v77;

  self->_switchInterfaceOrNoCVMSuccess = a28;
  self->_cardExpirationState = a29;
  self->_cardEffectiveState = a30;
  payAppType = self->_payAppType;
  self->_payAppType = 0;

  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassEnabled:(BOOL)a24 isPINBypassAllowed:(BOOL)a25 forFallback:(BOOL)a26 fallbackAmount:(id)a27 switchInterfaceOrNoCVMSuccess:(BOOL)a28 cardExpirationState:(unsigned __int8)a29 cardEffectiveState:(unsigned __int8)a30 payAppType:(id)a31
{
  NSArray *v36;
  NSData *v37;
  NSData *v38;
  NSString *v39;
  NSData *v40;
  NSString *v41;
  NSString *v42;
  NSData *v43;
  NSArray *vasResponses;
  NSData *cardHolderData;
  NSData *transactionCipherBlob;
  NSData *transactionKeyBlob;
  NSString *network;
  NSData *errorIndicationStatusWord;
  NSData *cvmResult;
  NSData *merchantCategoryCode;
  NSData *kernelIdentityKeyAttestation;
  NSData *v53;
  NSData *ecdsaCertificate;
  NSData *v55;
  NSData *transactionResultData;
  NSData *v57;
  NSString *kekId;
  NSString *v59;
  NSString *pinKekId;
  NSString *v61;
  NSData *languagePreference;
  NSData *v63;
  NSString *transactionId;
  NSString *v65;
  NSString *fallbackAmount;
  NSString *v67;
  NSString *payAppType;
  NSData *v70;
  NSData *v71;
  NSData *v72;
  NSData *v73;
  NSData *v74;
  NSData *v75;
  NSData *v76;
  NSString *v77;
  NSData *v79;
  NSString *v80;
  NSString *v81;
  NSString *v82;
  NSData *v83;
  NSData *v84;
  NSArray *v85;

  v36 = (NSArray *)a3;
  v37 = (NSData *)a4;
  v38 = (NSData *)a5;
  v39 = (NSString *)a6;
  v40 = (NSData *)a8;
  v70 = (NSData *)a11;
  v71 = (NSData *)a12;
  v72 = (NSData *)a14;
  v73 = (NSData *)a15;
  v74 = (NSData *)a16;
  v41 = (NSString *)a17;
  v42 = (NSString *)a18;
  v43 = (NSData *)a20;
  v77 = (NSString *)a21;
  v80 = (NSString *)a27;
  v81 = (NSString *)a31;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v36;
  v85 = v36;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = 0;

  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = v37;
  v84 = v37;

  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = v38;
  v83 = v38;

  network = self->_network;
  self->_network = v39;
  v82 = v39;

  self->_outcomeStatus = a7;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v40;
  v79 = v40;

  self->_errorIndicationMsgOnError = a9;
  self->_cvmType = a10;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v70;
  v76 = v70;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v71;
  v75 = v71;

  self->_pinRequired = a13;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v72;
  v53 = v72;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v73;
  v55 = v73;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v74;
  v57 = v74;

  kekId = self->_kekId;
  self->_kekId = v41;
  v59 = v41;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v42;
  v61 = v42;

  self->_isPinSupported = a19;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v43;
  v63 = v43;

  transactionId = self->_transactionId;
  self->_transactionId = v77;
  v65 = v77;

  self->_payAppletFinalStatus = a23;
  self->_isPINBypassEnabled = a24;
  self->_isPINBypassAllowed = a25;
  self->_forFallback = a26;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a22;
  self->_fallbackAmount = v80;
  v67 = v80;

  self->_switchInterfaceOrNoCVMSuccess = a28;
  self->_cardExpirationState = a29;
  self->_cardEffectiveState = a30;
  payAppType = self->_payAppType;
  self->_payAppType = v81;

  self->_isSAF = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRTransactionData)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  NSArray *vasResponses;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSData *v22;
  NSData *cardHolderData;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSData *v28;
  NSData *transactionCipherBlob;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSData *v34;
  NSData *transactionKeyBlob;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSString *v40;
  NSString *network;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  NSData *v50;
  NSData *errorIndicationStatusWord;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  NSData *v64;
  NSData *cvmResult;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSData *v70;
  NSData *merchantCategoryCode;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  NSData *v80;
  NSData *kernelIdentityKeyAttestation;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  NSData *v86;
  NSData *ecdsaCertificate;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  NSData *v92;
  NSData *transactionResultData;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  NSString *v98;
  NSString *kekId;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  NSString *v104;
  NSString *pinKekId;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  NSData *v114;
  NSData *languagePreference;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  NSString *v120;
  NSString *transactionId;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  NSString *v146;
  NSString *fallbackAmount;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  NSString *v164;
  NSString *payAppType;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend_setWithObjects_(v4, v8, v6, v9, v10, v11, v7, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v13, (uint64_t)v12, (uint64_t)CFSTR("vasResponses"), v14, v15);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  vasResponses = self->_vasResponses;
  self->_vasResponses = v16;

  v18 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v19, v18, (uint64_t)CFSTR("cardHolderData"), v20, v21);
  v22 = (NSData *)objc_claimAutoreleasedReturnValue();
  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = v22;

  v24 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v25, v24, (uint64_t)CFSTR("transactionCipherBlob"), v26, v27);
  v28 = (NSData *)objc_claimAutoreleasedReturnValue();
  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = v28;

  v30 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v31, v30, (uint64_t)CFSTR("transactionKeyBlob"), v32, v33);
  v34 = (NSData *)objc_claimAutoreleasedReturnValue();
  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = v34;

  v36 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v37, v36, (uint64_t)CFSTR("network"), v38, v39);
  v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  network = self->_network;
  self->_network = v40;

  self->_outcomeStatus = objc_msgSend_decodeIntegerForKey_(v5, v42, (uint64_t)CFSTR("outcomeStatus"), v43, v44, v45);
  v46 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v47, v46, (uint64_t)CFSTR("errorIndicationStatusWord"), v48, v49);
  v50 = (NSData *)objc_claimAutoreleasedReturnValue();
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v50;

  self->_errorIndicationMsgOnError = objc_msgSend_decodeIntegerForKey_(v5, v52, (uint64_t)CFSTR("errorIndicationMsgOnError"), v53, v54, v55);
  self->_cvmType = objc_msgSend_decodeIntegerForKey_(v5, v56, (uint64_t)CFSTR("cvmType"), v57, v58, v59);
  v60 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v61, v60, (uint64_t)CFSTR("cvmResult"), v62, v63);
  v64 = (NSData *)objc_claimAutoreleasedReturnValue();
  cvmResult = self->_cvmResult;
  self->_cvmResult = v64;

  v66 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v67, v66, (uint64_t)CFSTR("merchantCategoryCode"), v68, v69);
  v70 = (NSData *)objc_claimAutoreleasedReturnValue();
  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v70;

  self->_pinRequired = objc_msgSend_decodeBoolForKey_(v5, v72, (uint64_t)CFSTR("pinRequired"), v73, v74, v75);
  v76 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v77, v76, (uint64_t)CFSTR("kernelIdentityKeyAttestation"), v78, v79);
  v80 = (NSData *)objc_claimAutoreleasedReturnValue();
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v80;

  v82 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v83, v82, (uint64_t)CFSTR("ecdsaCertificate"), v84, v85);
  v86 = (NSData *)objc_claimAutoreleasedReturnValue();
  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v86;

  v88 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v89, v88, (uint64_t)CFSTR("transactionResultData"), v90, v91);
  v92 = (NSData *)objc_claimAutoreleasedReturnValue();
  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v92;

  v94 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v95, v94, (uint64_t)CFSTR("kekId"), v96, v97);
  v98 = (NSString *)objc_claimAutoreleasedReturnValue();
  kekId = self->_kekId;
  self->_kekId = v98;

  v100 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v101, v100, (uint64_t)CFSTR("pinKekId"), v102, v103);
  v104 = (NSString *)objc_claimAutoreleasedReturnValue();
  pinKekId = self->_pinKekId;
  self->_pinKekId = v104;

  self->_isPinSupported = objc_msgSend_decodeBoolForKey_(v5, v106, (uint64_t)CFSTR("isPinSupported"), v107, v108, v109);
  v110 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v111, v110, (uint64_t)CFSTR("languagePreference"), v112, v113);
  v114 = (NSData *)objc_claimAutoreleasedReturnValue();
  languagePreference = self->_languagePreference;
  self->_languagePreference = v114;

  v116 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v117, v116, (uint64_t)CFSTR("transactionId"), v118, v119);
  v120 = (NSString *)objc_claimAutoreleasedReturnValue();
  transactionId = self->_transactionId;
  self->_transactionId = v120;

  self->_readError = objc_msgSend_decodeIntegerForKey_(v5, v122, (uint64_t)CFSTR("readError"), v123, v124, v125);
  self->_payAppletFinalStatus = objc_msgSend_decodeIntegerForKey_(v5, v126, (uint64_t)CFSTR("payAppletFinalStatus"), v127, v128, v129);
  self->_isPINBypassEnabled = objc_msgSend_decodeBoolForKey_(v5, v130, (uint64_t)CFSTR("isPINBypassEnabled"), v131, v132, v133);
  self->_isPINBypassAllowed = objc_msgSend_decodeBoolForKey_(v5, v134, (uint64_t)CFSTR("isPINBypassAllowed"), v135, v136, v137);
  self->_forFallback = objc_msgSend_decodeBoolForKey_(v5, v138, (uint64_t)CFSTR("forFallback"), v139, v140, v141);
  v142 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v143, v142, (uint64_t)CFSTR("fallbackAmount"), v144, v145);
  v146 = (NSString *)objc_claimAutoreleasedReturnValue();
  fallbackAmount = self->_fallbackAmount;
  self->_fallbackAmount = v146;

  self->_switchInterfaceOrNoCVMSuccess = objc_msgSend_decodeBoolForKey_(v5, v148, (uint64_t)CFSTR("switchInterfaceOrNoCVMSuccess"), v149, v150, v151);
  self->_cardExpirationState = objc_msgSend_decodeIntegerForKey_(v5, v152, (uint64_t)CFSTR("cardExpirationState"), v153, v154, v155);
  self->_cardEffectiveState = objc_msgSend_decodeIntegerForKey_(v5, v156, (uint64_t)CFSTR("cardEffectiveState"), v157, v158, v159);
  v160 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v161, v160, (uint64_t)CFSTR("payAppType"), v162, v163);
  v164 = (NSString *)objc_claimAutoreleasedReturnValue();
  payAppType = self->_payAppType;
  self->_payAppType = v164;

  LOBYTE(v12) = objc_msgSend_decodeBoolForKey_(v5, v166, (uint64_t)CFSTR("isSAF"), v167, v168, v169);
  self->_isSAF = (char)v12;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *vasResponses;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  id v98;

  vasResponses = self->_vasResponses;
  v98 = a3;
  objc_msgSend_encodeObject_forKey_(v98, v5, (uint64_t)vasResponses, (uint64_t)CFSTR("vasResponses"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v98, v8, (uint64_t)self->_cardHolderData, (uint64_t)CFSTR("cardHolderData"), v9, v10);
  objc_msgSend_encodeObject_forKey_(v98, v11, (uint64_t)self->_transactionCipherBlob, (uint64_t)CFSTR("transactionCipherBlob"), v12, v13);
  objc_msgSend_encodeObject_forKey_(v98, v14, (uint64_t)self->_transactionKeyBlob, (uint64_t)CFSTR("transactionKeyBlob"), v15, v16);
  objc_msgSend_encodeObject_forKey_(v98, v17, (uint64_t)self->_network, (uint64_t)CFSTR("network"), v18, v19);
  objc_msgSend_encodeInteger_forKey_(v98, v20, self->_outcomeStatus, (uint64_t)CFSTR("outcomeStatus"), v21, v22);
  objc_msgSend_encodeObject_forKey_(v98, v23, (uint64_t)self->_errorIndicationStatusWord, (uint64_t)CFSTR("errorIndicationStatusWord"), v24, v25);
  objc_msgSend_encodeInteger_forKey_(v98, v26, self->_errorIndicationMsgOnError, (uint64_t)CFSTR("errorIndicationMsgOnError"), v27, v28);
  objc_msgSend_encodeInteger_forKey_(v98, v29, self->_cvmType, (uint64_t)CFSTR("cvmType"), v30, v31);
  objc_msgSend_encodeObject_forKey_(v98, v32, (uint64_t)self->_cvmResult, (uint64_t)CFSTR("cvmResult"), v33, v34);
  objc_msgSend_encodeObject_forKey_(v98, v35, (uint64_t)self->_merchantCategoryCode, (uint64_t)CFSTR("merchantCategoryCode"), v36, v37);
  objc_msgSend_encodeBool_forKey_(v98, v38, self->_pinRequired, (uint64_t)CFSTR("pinRequired"), v39, v40);
  objc_msgSend_encodeObject_forKey_(v98, v41, (uint64_t)self->_kernelIdentityKeyAttestation, (uint64_t)CFSTR("kernelIdentityKeyAttestation"), v42, v43);
  objc_msgSend_encodeObject_forKey_(v98, v44, (uint64_t)self->_ecdsaCertificate, (uint64_t)CFSTR("ecdsaCertificate"), v45, v46);
  objc_msgSend_encodeObject_forKey_(v98, v47, (uint64_t)self->_transactionResultData, (uint64_t)CFSTR("transactionResultData"), v48, v49);
  objc_msgSend_encodeObject_forKey_(v98, v50, (uint64_t)self->_kekId, (uint64_t)CFSTR("kekId"), v51, v52);
  objc_msgSend_encodeObject_forKey_(v98, v53, (uint64_t)self->_pinKekId, (uint64_t)CFSTR("pinKekId"), v54, v55);
  objc_msgSend_encodeBool_forKey_(v98, v56, self->_isPinSupported, (uint64_t)CFSTR("isPinSupported"), v57, v58);
  objc_msgSend_encodeObject_forKey_(v98, v59, (uint64_t)self->_languagePreference, (uint64_t)CFSTR("languagePreference"), v60, v61);
  objc_msgSend_encodeObject_forKey_(v98, v62, (uint64_t)self->_transactionId, (uint64_t)CFSTR("transactionId"), v63, v64);
  objc_msgSend_encodeInteger_forKey_(v98, v65, self->_readError, (uint64_t)CFSTR("readError"), v66, v67);
  objc_msgSend_encodeInteger_forKey_(v98, v68, self->_payAppletFinalStatus, (uint64_t)CFSTR("payAppletFinalStatus"), v69, v70);
  objc_msgSend_encodeBool_forKey_(v98, v71, self->_isPINBypassEnabled, (uint64_t)CFSTR("isPINBypassEnabled"), v72, v73);
  objc_msgSend_encodeBool_forKey_(v98, v74, self->_isPINBypassAllowed, (uint64_t)CFSTR("isPINBypassAllowed"), v75, v76);
  objc_msgSend_encodeBool_forKey_(v98, v77, self->_forFallback, (uint64_t)CFSTR("forFallback"), v78, v79);
  objc_msgSend_encodeObject_forKey_(v98, v80, (uint64_t)self->_fallbackAmount, (uint64_t)CFSTR("fallbackAmount"), v81, v82);
  objc_msgSend_encodeBool_forKey_(v98, v83, self->_switchInterfaceOrNoCVMSuccess, (uint64_t)CFSTR("switchInterfaceOrNoCVMSuccess"), v84, v85);
  objc_msgSend_encodeInteger_forKey_(v98, v86, self->_cardExpirationState, (uint64_t)CFSTR("cardExpirationState"), v87, v88);
  objc_msgSend_encodeInteger_forKey_(v98, v89, self->_cardEffectiveState, (uint64_t)CFSTR("cardEffectiveState"), v90, v91);
  objc_msgSend_encodeObject_forKey_(v98, v92, (uint64_t)self->_payAppType, (uint64_t)CFSTR("payAppType"), v93, v94);
  objc_msgSend_encodeBool_forKey_(v98, v95, self->_isSAF, (uint64_t)CFSTR("isSAF"), v96, v97);

}

- (NSArray)vasResponses
{
  return self->_vasResponses;
}

- (NSData)cardHolderData
{
  return self->_cardHolderData;
}

- (NSData)transactionCipherBlob
{
  return self->_transactionCipherBlob;
}

- (NSData)transactionKeyBlob
{
  return self->_transactionKeyBlob;
}

- (NSString)network
{
  return self->_network;
}

- (unsigned)outcomeStatus
{
  return self->_outcomeStatus;
}

- (NSData)errorIndicationStatusWord
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (unsigned)errorIndicationMsgOnError
{
  return self->_errorIndicationMsgOnError;
}

- (unsigned)cvmType
{
  return self->_cvmType;
}

- (NSData)cvmResult
{
  return self->_cvmResult;
}

- (NSData)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (BOOL)pinRequired
{
  return self->_pinRequired;
}

- (NSData)kernelIdentityKeyAttestation
{
  return self->_kernelIdentityKeyAttestation;
}

- (NSData)ecdsaCertificate
{
  return self->_ecdsaCertificate;
}

- (NSData)transactionResultData
{
  return self->_transactionResultData;
}

- (NSString)kekId
{
  return self->_kekId;
}

- (NSString)pinKekId
{
  return self->_pinKekId;
}

- (BOOL)isPinSupported
{
  return self->_isPinSupported;
}

- (NSData)languagePreference
{
  return self->_languagePreference;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (int64_t)readError
{
  return self->_readError;
}

- (unsigned)payAppletFinalStatus
{
  return self->_payAppletFinalStatus;
}

- (BOOL)isPINBypassEnabled
{
  return self->_isPINBypassEnabled;
}

- (BOOL)isPINBypassAllowed
{
  return self->_isPINBypassAllowed;
}

- (BOOL)forFallback
{
  return self->_forFallback;
}

- (NSString)fallbackAmount
{
  return self->_fallbackAmount;
}

- (BOOL)switchInterfaceOrNoCVMSuccess
{
  return self->_switchInterfaceOrNoCVMSuccess;
}

- (unsigned)cardExpirationState
{
  return self->_cardExpirationState;
}

- (unsigned)cardEffectiveState
{
  return self->_cardEffectiveState;
}

- (NSString)payAppType
{
  return self->_payAppType;
}

- (BOOL)isSAF
{
  return self->_isSAF;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payAppType, 0);
  objc_storeStrong((id *)&self->_fallbackAmount, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_languagePreference, 0);
  objc_storeStrong((id *)&self->_pinKekId, 0);
  objc_storeStrong((id *)&self->_kekId, 0);
  objc_storeStrong((id *)&self->_transactionResultData, 0);
  objc_storeStrong((id *)&self->_ecdsaCertificate, 0);
  objc_storeStrong((id *)&self->_kernelIdentityKeyAttestation, 0);
  objc_storeStrong((id *)&self->_merchantCategoryCode, 0);
  objc_storeStrong((id *)&self->_cvmResult, 0);
  objc_storeStrong((id *)&self->_errorIndicationStatusWord, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_transactionKeyBlob, 0);
  objc_storeStrong((id *)&self->_transactionCipherBlob, 0);
  objc_storeStrong((id *)&self->_cardHolderData, 0);
  objc_storeStrong((id *)&self->_vasResponses, 0);
}

@end
