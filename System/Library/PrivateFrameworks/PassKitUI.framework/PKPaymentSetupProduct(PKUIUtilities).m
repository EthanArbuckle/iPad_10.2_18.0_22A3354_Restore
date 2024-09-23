@implementation PKPaymentSetupProduct(PKUIUtilities)

- (id)digitalCardCachedImage:()PKUIUtilities
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  void *v14;
  void (**v15)(id, _QWORD, void *);

  v4 = a3;
  objc_msgSend(a1, "imageAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "digitalCardImage");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v6, 0, PKUIScreenScale());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v4[2](v4, 0, v7);
  }
  else
  {
    objc_msgSend(a1, "imageAssetURLs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "digitalCardImageUrl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__PKPaymentSetupProduct_PKUIUtilities__digitalCardCachedImage___block_invoke;
    v12[3] = &unk_1E3E764E8;
    v13 = v9;
    v14 = a1;
    v15 = v4;
    v10 = v9;
    PKCommonCachedImageFromURL(v10, v12);

    v7 = 0;
  }

  return v7;
}

- (id)_getCardImageUrlFromMetadata:()PKUIUtilities forScale:
{
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v16[16];

  objc_msgSend(a4, "readerModeResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AE58]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("plasticCardImages"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v8 = CFSTR("2x");
      if (a1 > 2.0)
        v8 = CFSTR("3x");
      v9 = (void *)MEMORY[0x1E0C99E98];
      v10 = v8;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "URLWithString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Malformed reader mode resources - missing URLs", v16, 2u);
      }

      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)plasticCardCachedImage:()PKUIUtilities
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  void *v14;
  void (**v15)(id, _QWORD, void *);

  v4 = a3;
  objc_msgSend(a1, "imageAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "plasticCardImage");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v6, 0, PKUIScreenScale());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v4[2](v4, 0, v7);
  }
  else
  {
    objc_msgSend(a1, "provisioningMethodMetadataForType:", *MEMORY[0x1E0D6AE40]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKScreenScale();
    objc_msgSend(a1, "_getCardImageUrlFromMetadata:forScale:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__PKPaymentSetupProduct_PKUIUtilities__plasticCardCachedImage___block_invoke;
    v12[3] = &unk_1E3E764E8;
    v13 = v9;
    v14 = a1;
    v15 = v4;
    v10 = v9;
    PKCommonCachedImageFromURL(v10, v12);

    v7 = 0;
  }

  return v7;
}

- (id)thumbnailCachedImageForSize:()PKUIUtilities completion:
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v31[5];
  void (**v32)(id, _QWORD, id);

  v4 = a3;
  objc_msgSend(a1, "imageAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "thumbnailImage");

  if (!v6)
  {
    objc_msgSend(a1, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "featureIdentifier");
    if (v10 == 4)
    {
      v12 = (void *)MEMORY[0x1E0DC3870];
      PKPassKitUIFoundationBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageNamed:inBundle:", CFSTR("AppleBalance-CardTypePicker"), v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v10 != 2)
        goto LABEL_13;
      PKUIImageNamed(CFSTR("CardTypePicker-CCS"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(a1, "imageAssets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_retainAutorelease(v11);
    objc_msgSend(v14, "setThumbnailImage:", objc_msgSend(v15, "CGImage"));

    if (v15)
    {
      if (v4)
        v4[2](v4, 0, v15);
      v8 = v15;
      goto LABEL_25;
    }
LABEL_13:
    objc_msgSend(a1, "paymentOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "cardType");
    objc_msgSend(a1, "imageAssetURLs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "thumbnailImageUrl");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 || v18 != 103)
    {
      if (objc_msgSend(v9, "type") == 6)
      {
        objc_msgSend(a1, "provisioningExtension");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "icons");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;
          objc_msgSend(a1, "imageAssets");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_retainAutorelease(v27);
          objc_msgSend(v28, "setThumbnailImage:", objc_msgSend(v29, "CGImage"));

          if (v4)
            v4[2](v4, 0, v29);
          v8 = v29;

          goto LABEL_24;
        }

      }
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __79__PKPaymentSetupProduct_PKUIUtilities__thumbnailCachedImageForSize_completion___block_invoke;
      v31[3] = &unk_1E3E632B8;
      v31[4] = a1;
      v32 = v4;
      PKCommonCachedImageFromURL(v20, v31);

      v8 = 0;
    }
    else
    {
      PKUIImageNamed(CFSTR("SuicaCard"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "imageAssets");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_retainAutorelease(v21);
      objc_msgSend(v22, "setThumbnailImage:", objc_msgSend(v23, "CGImage"));

      v8 = v23;
      if (v4)
        v4[2](v4, 0, v8);
    }
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v6, 0, PKUIScreenScale());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[2](v4, 0, v7);
  v8 = v7;
LABEL_26:

  return v8;
}

- (id)logoCachedImage:()PKUIUtilities
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  void (**v12)(id, _QWORD, void *);

  v4 = a3;
  objc_msgSend(a1, "imageAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "logoImage");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v6, 0, PKUIScreenScale());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v4[2](v4, 0, v7);
  }
  else
  {
    objc_msgSend(a1, "imageAssetURLs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logoImageUrl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__PKPaymentSetupProduct_PKUIUtilities__logoCachedImage___block_invoke;
    v11[3] = &unk_1E3E632B8;
    v11[4] = a1;
    v12 = v4;
    PKCommonCachedImageFromURL(v9, v11);

    v7 = 0;
  }

  return v7;
}

- (void)resetCache
{
  id v1;

  objc_msgSend(a1, "imageAssets");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setThumbnailImage:", 0);
  objc_msgSend(v1, "setLogoImage:", 0);
  objc_msgSend(v1, "setPlasticCardImage:", 0);
  objc_msgSend(v1, "setDigitalCardImage:", 0);

}

@end
