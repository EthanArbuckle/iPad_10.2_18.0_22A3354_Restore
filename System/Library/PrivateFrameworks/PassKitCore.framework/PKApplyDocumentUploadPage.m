@implementation PKApplyDocumentUploadPage

- (PKApplyDocumentUploadPage)initWithJSONObject:(id)a3
{
  id v4;
  PKApplyDocumentUploadPage *v5;
  PKApplyDocumentUploadPage *v6;
  void *v7;
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  PKDocumentRequest *v19;
  uint64_t v20;
  NSArray *acceptableDocuments;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  uint64_t v29;
  NSArray *imageCaptureEncryptionCertificates;
  uint64_t v31;
  NSString *imageCaptureEncryptionVersion;
  PKApplyDocumentUploadPage *v34;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)PKApplyDocumentUploadPage;
  v5 = -[PKDynamicProvisioningPageContent initWithDictonary:](&v51, sel_initWithDictonary_, v4);
  v6 = v5;
  if (v5)
  {
    v34 = v5;
    v35 = v4;
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("acceptableDocuments"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v7;
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (v38)
    {
      v37 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v48 != v37)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v10, "PKStringForKey:", CFSTR("documentType"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = PKPaymentDocumentTypeFromString(v11);

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v10, "PKArrayForKey:", CFSTR("countryCodes"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v44;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v44 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
                v19 = objc_alloc_init(PKDocumentRequest);
                -[PKDocumentRequest setDocumentType:](v19, "setDocumentType:", v12);
                -[PKDocumentRequest setCountryCode:](v19, "setCountryCode:", v18);
                objc_msgSend(v8, "safelyAddObject:", v19);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
            }
            while (v15);
          }

        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      }
      while (v38);
    }

    v20 = objc_msgSend(v8, "copy");
    v6 = v34;
    acceptableDocuments = v34->_acceptableDocuments;
    v34->_acceptableDocuments = (NSArray *)v20;

    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v4 = v35;
    objc_msgSend(v35, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("imageCaptureEncryptionCertificates"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(v23);
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k), 0);
          objc_msgSend(v22, "safelyAddObject:", v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      }
      while (v25);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v22);
    v29 = objc_claimAutoreleasedReturnValue();
    imageCaptureEncryptionCertificates = v34->_imageCaptureEncryptionCertificates;
    v34->_imageCaptureEncryptionCertificates = (NSArray *)v29;

    objc_msgSend(v35, "PKStringForKey:", CFSTR("imageCaptureEncryptionVersion"));
    v31 = objc_claimAutoreleasedReturnValue();
    imageCaptureEncryptionVersion = v34->_imageCaptureEncryptionVersion;
    v34->_imageCaptureEncryptionVersion = (NSString *)v31;

    v34->_requiresCoreIDVImageCaptureUpload = objc_msgSend(v35, "PKBoolForKey:", CFSTR("requiresCoreIDVImageCaptureUpload"));
  }

  return v6;
}

- (NSArray)acceptableDocuments
{
  return self->_acceptableDocuments;
}

- (void)setAcceptableDocuments:(id)a3
{
  objc_storeStrong((id *)&self->_acceptableDocuments, a3);
}

- (BOOL)requiresCoreIDVImageCaptureUpload
{
  return self->_requiresCoreIDVImageCaptureUpload;
}

- (NSArray)imageCaptureEncryptionCertificates
{
  return self->_imageCaptureEncryptionCertificates;
}

- (NSString)imageCaptureEncryptionVersion
{
  return self->_imageCaptureEncryptionVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCaptureEncryptionVersion, 0);
  objc_storeStrong((id *)&self->_imageCaptureEncryptionCertificates, 0);
  objc_storeStrong((id *)&self->_acceptableDocuments, 0);
}

@end
