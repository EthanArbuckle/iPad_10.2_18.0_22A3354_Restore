@implementation VSAppDescription

- (VSAppDescription)init
{
  VSAppDescription *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSAppDescription;
  v2 = -[VSAppDescription init](&v5, sel_init);
  if (v2)
  {
    VSAppDescriptionValueType();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInit();

  }
  return v2;
}

- (VSAppDescription)initWithCoder:(id)a3
{
  id v4;
  VSAppDescription *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSAppDescription;
  v5 = -[VSAppDescription init](&v8, sel_init);
  if (v5)
  {
    VSAppDescriptionValueType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInitWithCoder();

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  VSAppDescriptionValueType();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder();

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  VSAppDescriptionValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeCopyWithZone();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  VSAppDescriptionValueType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = VSValueTypeHash();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  void *v4;
  char IsEqual;

  v3 = a3;
  VSAppDescriptionValueType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsEqual = VSValueTypeIsEqual();

  return IsEqual;
}

- (id)description
{
  void *v2;
  void *v3;

  VSAppDescriptionValueType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeDescription();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)iconURLForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  height = a3.height;
  width = a3.width;
  -[VSAppDescription artworkURLTemplate](self, "artworkURLTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{f}"), CFSTR("png"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", width);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{h}"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{c}"), &stru_24FE1B848);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)shortenedDisplayName
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[VSAppDescription displayName](self, "displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    return (NSString *)0;
  v3 = v2;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = objc_msgSend(&unk_24FE3CEF8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  v5 = v3;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v34;
    v5 = v3;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(&unk_24FE3CEF8);
        v9 = objc_msgSend(v5, "rangeOfString:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v5, "substringToIndex:", v9);
          v10 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v10;
        }
      }
      v6 = objc_msgSend(&unk_24FE3CEF8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v6);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = objc_msgSend(&unk_24FE3CF10, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(&unk_24FE3CF10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        if (objc_msgSend(v5, "hasPrefix:", v15))
        {
          objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v15, "length"));
          v16 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v16;
        }
      }
      v12 = objc_msgSend(&unk_24FE3CF10, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v12);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = objc_msgSend(&unk_24FE3CF28, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(&unk_24FE3CF28);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * k);
        if (objc_msgSend(v5, "hasSuffix:", v21))
        {
          objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - objc_msgSend(v21, "length"));
          v22 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v22;
        }
      }
      v18 = objc_msgSend(&unk_24FE3CF28, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v18);
  }
  v23 = (void *)objc_msgSend(v5, "copy");

  return (NSString *)v23;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)sellerName
{
  return self->_sellerName;
}

- (void)setSellerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)externalVersionID
{
  return self->_externalVersionID;
}

- (void)setExternalVersionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)appStoreURL
{
  return self->_appStoreURL;
}

- (void)setAppStoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)privacyPolicyEndpointURL
{
  return self->_privacyPolicyEndpointURL;
}

- (void)setPrivacyPolicyEndpointURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)licenseAgreementEndpointURL
{
  return self->_licenseAgreementEndpointURL;
}

- (void)setLicenseAgreementEndpointURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)rating
{
  return self->_rating;
}

- (void)setRating:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)contentRank
{
  return self->_contentRank;
}

- (void)setContentRank:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)offersInAppPurchases
{
  return self->_offersInAppPurchases;
}

- (void)setOffersInAppPurchases:(BOOL)a3
{
  self->_offersInAppPurchases = a3;
}

- (unint64_t)appType
{
  return self->_appType;
}

- (void)setAppType:(unint64_t)a3
{
  self->_appType = a3;
}

- (NSNumber)appSizeBytes
{
  return self->_appSizeBytes;
}

- (void)setAppSizeBytes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)artworkURLTemplate
{
  return self->_artworkURLTemplate;
}

- (void)setArtworkURLTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (BOOL)isDefaultAppForProvider
{
  return self->_defaultAppForProvider;
}

- (void)setDefaultAppForProvider:(BOOL)a3
{
  self->_defaultAppForProvider = a3;
}

- (NSNumber)isVisionOSCompatible
{
  return self->_visionOSCompatible;
}

- (void)setVisionOSCompatible:(id)a3
{
  objc_storeStrong((id *)&self->_visionOSCompatible, a3);
}

- (NSArray)deviceFamilies
{
  return self->_deviceFamilies;
}

- (void)setDeviceFamilies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceFamilies, 0);
  objc_storeStrong((id *)&self->_visionOSCompatible, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_artworkURLTemplate, 0);
  objc_storeStrong((id *)&self->_appSizeBytes, 0);
  objc_storeStrong((id *)&self->_contentRank, 0);
  objc_storeStrong((id *)&self->_rating, 0);
  objc_storeStrong((id *)&self->_licenseAgreementEndpointURL, 0);
  objc_storeStrong((id *)&self->_privacyPolicyEndpointURL, 0);
  objc_storeStrong((id *)&self->_appStoreURL, 0);
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_sellerName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
