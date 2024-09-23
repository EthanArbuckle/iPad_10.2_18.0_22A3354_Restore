@implementation PKApplyWebServiceApplyStepInfo

- (PKApplyWebServiceApplyStepInfo)initWithJSONObject:(id)a3 featureApplication:(id)a4
{
  id v6;
  PKApplyWebServiceApplyStepInfo *v7;
  void *v8;
  PKDynamicProvisioningPageContent *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  void *coreIDVSessionID;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  PKDynamicProvisioningPageContent *v21;
  uint64_t v22;
  NSArray *v23;
  uint64_t v24;
  NSString *coreIDVTier;
  uint64_t v26;
  NSString *coreIDVServiceProviderName;
  uint64_t v28;
  PKApplyDocumentUploadPage *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  PKApplyVerificationPage *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  PKApplyVerificationPage *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  PKApplyRequiredFieldsPage *v47;
  uint64_t v48;
  NSArray *pages;
  PKApplyWebServiceApplyStepInfo *v50;
  id v51;
  id v52;
  id obj;
  id obja;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  PKDynamicProvisioningPageContent *v65;
  _BYTE v66[128];
  PKDynamicProvisioningPageContent *v67;
  PKApplyDocumentUploadPage *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v55 = a4;
  v64.receiver = self;
  v64.super_class = (Class)PKApplyWebServiceApplyStepInfo;
  v7 = -[PKApplyWebServiceApplyStepInfo init](&v64, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "PKStringForKey:", CFSTR("contextType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_contextType = PKApplyContextTypeFromString(v8);

    switch(v7->_contextType)
    {
      case 0uLL:
        -[PKApplyWebServiceApplyStepInfo _handleCertificates:](v7, "_handleCertificates:", v6);
        objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredFieldsByPage"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        coreIDVSessionID = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("requiredFieldOptions"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        v51 = v6;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          objc_msgSend(v6, "PKStringForKey:", CFSTR("contextIdentifier"));
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        v41 = v20;

        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        obja = v16;
        v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        if (v42)
        {
          v43 = v42;
          v44 = 0;
          v45 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v43; ++i)
            {
              if (*(_QWORD *)v61 != v45)
                objc_enumerationMutation(obja);
              v47 = -[PKApplyRequiredFieldsPage initWithDictionary:fieldOptions:featureApplication:]([PKApplyRequiredFieldsPage alloc], "initWithDictionary:fieldOptions:featureApplication:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i), v17, v55);
              -[PKDynamicProvisioningPageContent setPageNumber:](v47, "setPageNumber:", v44 + i);
              -[PKDynamicProvisioningPageContent setIdentifier:](v47, "setIdentifier:", v41);
              objc_msgSend(coreIDVSessionID, "safelyAddObject:", v47);

            }
            v43 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
            v44 += i;
          }
          while (v43);
        }
        v10 = obja;

        v48 = objc_msgSend(coreIDVSessionID, "copy");
        pages = v7->_pages;
        v7->_pages = (NSArray *)v48;

        v6 = v51;
        goto LABEL_6;
      case 1uLL:
        v21 = -[PKDynamicProvisioningPageContent initWithDictonary:]([PKDynamicProvisioningPageContent alloc], "initWithDictonary:", v6);
        v10 = v21;
        if (v21)
        {
          v67 = v21;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = v7->_pages;
          v7->_pages = (NSArray *)v22;

        }
        objc_msgSend(v6, "PKStringForKey:", CFSTR("coreIDVTier"));
        v24 = objc_claimAutoreleasedReturnValue();
        coreIDVTier = v7->_coreIDVTier;
        v7->_coreIDVTier = (NSString *)v24;

        objc_msgSend(v6, "PKStringForKey:", CFSTR("coreIDVServiceProviderName"));
        v26 = objc_claimAutoreleasedReturnValue();
        coreIDVServiceProviderName = v7->_coreIDVServiceProviderName;
        v7->_coreIDVServiceProviderName = (NSString *)v26;

        objc_msgSend(v6, "PKStringForKey:", CFSTR("coreIDVSessionID"));
        v28 = objc_claimAutoreleasedReturnValue();
        coreIDVSessionID = v7->_coreIDVSessionID;
        v7->_coreIDVSessionID = (NSString *)v28;
        goto LABEL_6;
      case 2uLL:
        -[PKApplyWebServiceApplyStepInfo _handleCertificates:](v7, "_handleCertificates:", v6);
        v29 = -[PKApplyDocumentUploadPage initWithJSONObject:]([PKApplyDocumentUploadPage alloc], "initWithJSONObject:", v6);
        v10 = v29;
        if (!v29)
          goto LABEL_7;
        v68 = v29;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v68;
        break;
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 0xAuLL:
        v9 = -[PKDynamicProvisioningPageContent initWithDictonary:]([PKDynamicProvisioningPageContent alloc], "initWithDictonary:", v6);
        v10 = v9;
        if (!v9)
          goto LABEL_7;
        v65 = v9;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v65;
        break;
      case 9uLL:
        objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("requiredFieldOptions"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "PKStringForKey:", CFSTR("verificationType"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = PKApplyVerificationTypeFromString(v30);

        v32 = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("verificationCodeLength"));
        objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredFieldsByPage"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        obj = v33;
        if (objc_msgSend(v33, "count"))
        {
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v35 = v33;
          v36 = -[PKApplyVerificationPage countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
          if (v36)
          {
            v37 = v36;
            v50 = v7;
            v52 = v6;
            v38 = *(_QWORD *)v57;
            do
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v57 != v38)
                  objc_enumerationMutation(v35);
                v40 = -[PKApplyVerificationPage initWithDictionary:type:codeLength:fieldOptions:]([PKApplyVerificationPage alloc], "initWithDictionary:type:codeLength:fieldOptions:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j), v31, v32, v10);
                objc_msgSend(v34, "safelyAddObject:", v40);

              }
              v37 = -[PKApplyVerificationPage countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
            }
            while (v37);
            v7 = v50;
            v6 = v52;
          }
        }
        else
        {
          v35 = -[PKApplyVerificationPage initWithDictionary:type:codeLength:fieldOptions:]([PKApplyVerificationPage alloc], "initWithDictionary:type:codeLength:fieldOptions:", v6, v31, v32, v10);
          objc_msgSend(v34, "safelyAddObject:", v35);
        }

        if (objc_msgSend(v34, "count"))
          objc_storeStrong((id *)&v7->_pages, v34);

        coreIDVSessionID = obj;
        goto LABEL_6;
      default:
        goto LABEL_8;
    }
    objc_msgSend(v11, "arrayWithObjects:count:", v12, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    coreIDVSessionID = v7->_pages;
    v7->_pages = (NSArray *)v13;
LABEL_6:

LABEL_7:
  }
LABEL_8:

  return v7;
}

- (void)_handleCertificates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *v12;
  NSArray *encryptionCertificates;
  NSString *v14;
  NSString *encryptionVersion;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("encryptionCertificates"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10), 0);
        objc_msgSend(v5, "safelyAddObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  encryptionCertificates = self->_encryptionCertificates;
  self->_encryptionCertificates = v12;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("encryptionVersion"));
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  encryptionVersion = self->_encryptionVersion;
  self->_encryptionVersion = v14;

}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (void)setConversationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)contextType
{
  return self->_contextType;
}

- (NSArray)pages
{
  return self->_pages;
}

- (NSString)coreIDVSessionID
{
  return self->_coreIDVSessionID;
}

- (NSString)coreIDVServiceProviderName
{
  return self->_coreIDVServiceProviderName;
}

- (NSString)coreIDVTier
{
  return self->_coreIDVTier;
}

- (NSArray)encryptionCertificates
{
  return self->_encryptionCertificates;
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_encryptionCertificates, 0);
  objc_storeStrong((id *)&self->_coreIDVTier, 0);
  objc_storeStrong((id *)&self->_coreIDVServiceProviderName, 0);
  objc_storeStrong((id *)&self->_coreIDVSessionID, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
}

@end
