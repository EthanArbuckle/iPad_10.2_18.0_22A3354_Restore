@implementation PKPaymentHeroImage

- (PKPaymentHeroImage)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentHeroImage *v5;
  uint64_t v6;
  NSString *identifier;
  PKOSVersionRequirementRange *v8;
  void *v9;
  uint64_t v10;
  PKOSVersionRequirementRange *versionRequirement;
  uint64_t v12;
  NSArray *requiredDeviceFeatures;
  void *v14;
  PKPaymentHeroImageSet *v15;
  void *v16;
  uint64_t v17;
  PKPaymentHeroImageSet *images;
  PKPaymentHeroImage *v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  __int16 v24;
  __int16 v25;

  v4 = a3;
  v5 = -[PKPaymentHeroImage init](self, "init");
  if (!v5)
    goto LABEL_11;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  if (!v5->_identifier)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 0;
      v21 = "Invalid hero image identifier";
      v22 = (uint8_t *)&v25;
LABEL_9:
      _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
    }
LABEL_10:

LABEL_11:
    v19 = 0;
    goto LABEL_12;
  }
  v8 = [PKOSVersionRequirementRange alloc];
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("deviceVersionRequirement"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKOSVersionRequirementRange initWithDictionary:](v8, "initWithDictionary:", v9);
  versionRequirement = v5->_versionRequirement;
  v5->_versionRequirement = (PKOSVersionRequirementRange *)v10;

  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredDeviceFeatures"));
  v12 = objc_claimAutoreleasedReturnValue();
  requiredDeviceFeatures = v5->_requiredDeviceFeatures;
  v5->_requiredDeviceFeatures = (NSArray *)v12;

  v5->_credentialType = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("credentialType"));
  objc_msgSend(v4, "PKStringForKey:", CFSTR("cardType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_cardType = PKWebServicesPaymentCardTypeFromString(v14);

  v5->_isBeta = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("isBeta")) > 0;
  v15 = [PKPaymentHeroImageSet alloc];
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("images"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PKPaymentHeroImageSet initWithDictionary:](v15, "initWithDictionary:", v16);
  images = v5->_images;
  v5->_images = (PKPaymentHeroImageSet *)v17;

  if (!v5->_images)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 0;
      v21 = "Invalid hero image list";
      v22 = (uint8_t *)&v24;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v19 = v5;
LABEL_12:

  return v19;
}

- (PKPaymentHeroImage)initWithLegacyDictionary:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  PKPaymentHeroImage *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *identifier;
  PKPaymentHeroImageSet *v14;
  PKPaymentHeroImageSet *images;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *requiredDeviceFeatures;
  PKPaymentHeroImage *v20;
  NSObject *v21;
  const char *v22;
  uint8_t v24[16];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[PKPaymentHeroImage init](self, "init");
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v9, "numberFromString:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    PKPaymentNetworkNameForPaymentCredentialType(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v12;

    v8->_credentialType = v11;
    if (v11)
    {
      v14 = -[PKPaymentHeroImageSet initWithDictionary:]([PKPaymentHeroImageSet alloc], "initWithDictionary:", v6);
      images = v8->_images;
      v8->_images = v14;

      if (v8->_images)
      {
        objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("requirements"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("hardware"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "containsObject:", CFSTR("typef")))
        {
          v25[0] = CFSTR("type_f");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
          v18 = objc_claimAutoreleasedReturnValue();
          requiredDeviceFeatures = v8->_requiredDeviceFeatures;
          v8->_requiredDeviceFeatures = (NSArray *)v18;

        }
        goto LABEL_7;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        v22 = "Invalid hero image list";
        goto LABEL_12;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        v22 = "Invalid hero image identifier";
LABEL_12:
        _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, v22, v24, 2u);
      }
    }

    v20 = 0;
    goto LABEL_14;
  }
LABEL_7:
  v20 = v8;
LABEL_14:

  return v20;
}

- (PKPaymentHeroImage)initWithIdentifier:(id)a3 imageData:(id)a4 credentialType:(int64_t)a5
{
  id v9;
  id v10;
  PKPaymentHeroImage *v11;
  PKPaymentHeroImage *v12;

  v9 = a3;
  v10 = a4;
  v11 = -[PKPaymentHeroImage init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_imageData, a4);
    v12->_credentialType = a5;
  }

  return v12;
}

- (BOOL)hasCachedImageWithScale:(double)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  if (self->_imageData)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentHeroImage imageFilePathOnDiskForPreferredLanguages:scale:](self, "imageFilePathOnDiskForPreferredLanguages:scale:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  return v10;
}

- (PKPaymentHeroImage)imageWithScale:(double)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentHeroImage imageForPreferredLanguages:scale:](self, "imageForPreferredLanguages:scale:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPaymentHeroImage *)v6;
}

- (id)URLForImageWithScale:(double)a3
{
  PKPaymentHeroImageSet *images;
  void *v5;
  void *v6;
  void *v7;

  images = self->_images;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentHeroImageSet imageForPreferredLanguages:scale:](images, "imageForPreferredLanguages:scale:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imageForPreferredLanguages:(id)a3 scale:(double)a4
{
  NSData *imageData;
  NSData *v5;
  void *v6;
  void *v7;
  void *v8;

  imageData = self->_imageData;
  if (imageData)
  {
    v5 = imageData;
  }
  else
  {
    -[PKPaymentHeroImage imageFilePathOnDiskForPreferredLanguages:scale:](self, "imageFilePathOnDiskForPreferredLanguages:scale:", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataWithContentsOfFile:", v8);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)downloadImageWithScale:(double)a3 fileDownloader:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0C99DC8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "preferredLanguages");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentHeroImage downloadImageForPreferredLanguages:scale:fileDownloader:completion:](self, "downloadImageForPreferredLanguages:scale:fileDownloader:completion:", v11, v10, v9, a3);

}

- (void)downloadImageForPreferredLanguages:(id)a3 scale:(double)a4 fileDownloader:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  if (self->_imageData)
  {
    if (v12)
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }
  else
  {
    -[PKPaymentHeroImageSet imageForPreferredLanguages:scale:](self->_images, "imageForPreferredLanguages:scale:", v10, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "url");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __89__PKPaymentHeroImage_downloadImageForPreferredLanguages_scale_fileDownloader_completion___block_invoke;
      v18[3] = &unk_1E2AC70F8;
      v19 = v15;
      v20 = v13;
      objc_msgSend(v11, "downloadFromUrl:completionHandler:", v16, v18);

    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), -1, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v13)[2](v13, v17, 0);

    }
  }

}

void __89__PKPaymentHeroImage_downloadImageForPreferredLanguages_scale_fileDownloader_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "imageSha");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Downloading hero image %@ failed: %@", (uint8_t *)&v18, 0x16u);
    }

    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, id, _QWORD))(v10 + 16))(v10, v7, 0);
  }
  else
  {
    objc_msgSend(v6, "SHA1Hash");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hexEncoding");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "isEqualToString:", v8))
    {
      PKCacheFile(v6, v12);
      PKLogFacilityTypeGetObject(6uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v8;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Downloaded hero image %@", (uint8_t *)&v18, 0xCu);
      }

      v14 = *(_QWORD *)(a1 + 40);
      if (v14)
        (*(void (**)(uint64_t, _QWORD, id))(v14 + 16))(v14, 0, v6);
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v8;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Downloaded hero image with conflicting sha %@", (uint8_t *)&v18, 0xCu);
      }

      v16 = *(_QWORD *)(a1 + 40);
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v17, 0);

      }
    }

  }
}

- (id)imageFilePathOnDiskForPreferredLanguages:(id)a3 scale:(double)a4
{
  void *v5;
  void *v6;

  -[PKPaymentHeroImageSet imageForPreferredLanguages:scale:](self->_images, "imageForPreferredLanguages:scale:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentHeroImage imageFilePathForImageModel:](self, "imageFilePathForImageModel:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)imageFilePathForImageModel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "imageSha");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    PKPassAssetDownloadCachePath();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isSupportedByDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKOSVersionRequirementRange *versionRequirement;
  BOOL v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "deviceClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  versionRequirement = self->_versionRequirement;
  if (versionRequirement)
    v8 = v5 == 0;
  else
    v8 = 1;
  if ((v8
     || -[PKOSVersionRequirementRange versionMeetsRequirements:deviceClass:](versionRequirement, "versionMeetsRequirements:deviceClass:", v6, v5))&& (!-[NSArray containsObject:](self->_requiredDeviceFeatures, "containsObject:", CFSTR("type_f"))|| objc_msgSend(v4, "felicaSecureElementIsAvailable")))
  {
    v9 = objc_msgSend(v4, "supportsCredentialType:", -[PKPaymentHeroImage credentialType](self, "credentialType"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PKOSVersionRequirementRange)versionRequirement
{
  return self->_versionRequirement;
}

- (NSArray)requiredDeviceFeatures
{
  return self->_requiredDeviceFeatures;
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredDeviceFeatures, 0);
  objc_storeStrong((id *)&self->_versionRequirement, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
