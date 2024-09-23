@implementation ICQCloudStorageSummary

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("displayLabel: %@, totalStorage: %@, usedStorage: %@, freeStorage: %@, commerceStorage: %@, mediaStorage: %@, tips: %@, backupInfo: %@, subscriptionInfo: %@, manageStorageURL: %@, manageStorageTitle: %@, manageStorageActionButtonText: %@, manageStoragePage: %@, detailsPageInfo: %@,"), self->_displayLabel, self->_totalStorage, self->_usedStorage, self->_freeStorage, self->_commerceStorage, self->_mediaStorage, self->_tips, self->_backupInfo, self->_subscriptionInfo, self->_manageStorageURL, self->_manageStorageTitle, self->_manageStorageActionButtonText, self->_manageStoragePage, self->_iCloudDetailsPageInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" recommendationInfo: %@"), self->_recommendationInfo);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQCloudStorageSummary *v4;

  v4 = objc_alloc_init(ICQCloudStorageSummary);
  -[ICQCloudStorageSummary setDisplayLabel:](v4, "setDisplayLabel:", self->_displayLabel);
  -[ICQCloudStorageSummary setTotalStorage:](v4, "setTotalStorage:", self->_totalStorage);
  -[ICQCloudStorageSummary setUsedStorage:](v4, "setUsedStorage:", self->_usedStorage);
  -[ICQCloudStorageSummary setFreeStorage:](v4, "setFreeStorage:", self->_freeStorage);
  -[ICQCloudStorageSummary setCommerceStorage:](v4, "setCommerceStorage:", self->_commerceStorage);
  -[ICQCloudStorageSummary setMediaStorage:](v4, "setMediaStorage:", self->_mediaStorage);
  -[ICQCloudStorageSummary setTips:](v4, "setTips:", self->_tips);
  -[ICQCloudStorageSummary setBackupInfo:](v4, "setBackupInfo:", self->_backupInfo);
  -[ICQCloudStorageSummary setSubscriptionInfo:](v4, "setSubscriptionInfo:", self->_subscriptionInfo);
  -[ICQCloudStorageSummary setManageStorageURL:](v4, "setManageStorageURL:", self->_manageStorageURL);
  -[ICQCloudStorageSummary setManageStorageTitle:](v4, "setManageStorageTitle:", self->_manageStorageTitle);
  -[ICQCloudStorageSummary setManageStorageActionButtonText:](v4, "setManageStorageActionButtonText:", self->_manageStorageActionButtonText);
  -[ICQCloudStorageSummary setManageStoragePage:](v4, "setManageStoragePage:", self->_manageStoragePage);
  -[ICQCloudStorageSummary setICloudDetailsPageInfo:](v4, "setICloudDetailsPageInfo:", self->_iCloudDetailsPageInfo);
  -[ICQCloudStorageSummary setRecommendationInfo:](v4, "setRecommendationInfo:", self->_recommendationInfo);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *displayLabel;
  id v5;

  displayLabel = self->_displayLabel;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", displayLabel, CFSTR("displayLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalStorage, CFSTR("totalStorage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_usedStorage, CFSTR("usedStorage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_freeStorage, CFSTR("freeStorage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_commerceStorage, CFSTR("commerceStorageQuota"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaStorage, CFSTR("usageByMedia"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tips, CFSTR("tips"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backupInfo, CFSTR("backupInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subscriptionInfo, CFSTR("subscriptionInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manageStorageURL, CFSTR("manageStorageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manageStorageTitle, CFSTR("manageStorageTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manageStorageActionButtonText, CFSTR("manageStorageActionButtonText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manageStoragePage, CFSTR("manageStoragePage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iCloudDetailsPageInfo, CFSTR("iCloudDetailsPageInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recommendationInfo, CFSTR("recommendationInfo"));

}

- (ICQCloudStorageSummary)initWithCoder:(id)a3
{
  id v4;
  ICQCloudStorageSummary *v5;
  uint64_t v6;
  NSString *displayLabel;
  uint64_t v8;
  NSNumber *totalStorage;
  uint64_t v10;
  NSNumber *usedStorage;
  uint64_t v12;
  NSNumber *freeStorage;
  uint64_t v14;
  NSNumber *commerceStorage;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *mediaStorage;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *tips;
  uint64_t v26;
  ICQBackupInfo *backupInfo;
  uint64_t v28;
  ICQSubscriptionInfo *subscriptionInfo;
  uint64_t v30;
  NSURL *manageStorageURL;
  uint64_t v32;
  NSString *manageStorageTitle;
  uint64_t v34;
  NSString *manageStorageActionButtonText;
  uint64_t v36;
  ICQManageStoragePageInfo *manageStoragePage;
  uint64_t v38;
  ICQiCloudDetailsPageInfo *iCloudDetailsPageInfo;
  uint64_t v40;
  CERecommendationInfo *recommendationInfo;
  objc_super v43;
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)ICQCloudStorageSummary;
  v5 = -[ICQCloudStorageSummary init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayLabel"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayLabel = v5->_displayLabel;
    v5->_displayLabel = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalStorage"));
    v8 = objc_claimAutoreleasedReturnValue();
    totalStorage = v5->_totalStorage;
    v5->_totalStorage = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usedStorage"));
    v10 = objc_claimAutoreleasedReturnValue();
    usedStorage = v5->_usedStorage;
    v5->_usedStorage = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("freeStorage"));
    v12 = objc_claimAutoreleasedReturnValue();
    freeStorage = v5->_freeStorage;
    v5->_freeStorage = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commerceStorageQuota"));
    v14 = objc_claimAutoreleasedReturnValue();
    commerceStorage = v5->_commerceStorage;
    v5->_commerceStorage = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("usageByMedia"));
    v19 = objc_claimAutoreleasedReturnValue();
    mediaStorage = v5->_mediaStorage;
    v5->_mediaStorage = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("tips"));
    v24 = objc_claimAutoreleasedReturnValue();
    tips = v5->_tips;
    v5->_tips = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupInfo"));
    v26 = objc_claimAutoreleasedReturnValue();
    backupInfo = v5->_backupInfo;
    v5->_backupInfo = (ICQBackupInfo *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriptionInfo"));
    v28 = objc_claimAutoreleasedReturnValue();
    subscriptionInfo = v5->_subscriptionInfo;
    v5->_subscriptionInfo = (ICQSubscriptionInfo *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manageStorageURL"));
    v30 = objc_claimAutoreleasedReturnValue();
    manageStorageURL = v5->_manageStorageURL;
    v5->_manageStorageURL = (NSURL *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manageStorageTitle"));
    v32 = objc_claimAutoreleasedReturnValue();
    manageStorageTitle = v5->_manageStorageTitle;
    v5->_manageStorageTitle = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manageStorageActionButtonText"));
    v34 = objc_claimAutoreleasedReturnValue();
    manageStorageActionButtonText = v5->_manageStorageActionButtonText;
    v5->_manageStorageActionButtonText = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manageStoragePage"));
    v36 = objc_claimAutoreleasedReturnValue();
    manageStoragePage = v5->_manageStoragePage;
    v5->_manageStoragePage = (ICQManageStoragePageInfo *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iCloudDetailsPageInfo"));
    v38 = objc_claimAutoreleasedReturnValue();
    iCloudDetailsPageInfo = v5->_iCloudDetailsPageInfo;
    v5->_iCloudDetailsPageInfo = (ICQiCloudDetailsPageInfo *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recommendationInfo"));
    v40 = objc_claimAutoreleasedReturnValue();
    recommendationInfo = v5->_recommendationInfo;
    v5->_recommendationInfo = (CERecommendationInfo *)v40;

  }
  return v5;
}

- (BOOL)shouldUseNativeManageStorage
{
  return self->_manageStoragePage != 0;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (void)setDisplayLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)totalStorage
{
  return self->_totalStorage;
}

- (void)setTotalStorage:(id)a3
{
  objc_storeStrong((id *)&self->_totalStorage, a3);
}

- (NSNumber)usedStorage
{
  return self->_usedStorage;
}

- (void)setUsedStorage:(id)a3
{
  objc_storeStrong((id *)&self->_usedStorage, a3);
}

- (NSNumber)freeStorage
{
  return self->_freeStorage;
}

- (void)setFreeStorage:(id)a3
{
  objc_storeStrong((id *)&self->_freeStorage, a3);
}

- (NSNumber)commerceStorage
{
  return self->_commerceStorage;
}

- (void)setCommerceStorage:(id)a3
{
  objc_storeStrong((id *)&self->_commerceStorage, a3);
}

- (NSArray)mediaStorage
{
  return self->_mediaStorage;
}

- (void)setMediaStorage:(id)a3
{
  objc_storeStrong((id *)&self->_mediaStorage, a3);
}

- (NSArray)tips
{
  return self->_tips;
}

- (void)setTips:(id)a3
{
  objc_storeStrong((id *)&self->_tips, a3);
}

- (ICQBackupInfo)backupInfo
{
  return self->_backupInfo;
}

- (void)setBackupInfo:(id)a3
{
  objc_storeStrong((id *)&self->_backupInfo, a3);
}

- (ICQSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (void)setSubscriptionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionInfo, a3);
}

- (ICQiCloudDetailsPageInfo)iCloudDetailsPageInfo
{
  return self->_iCloudDetailsPageInfo;
}

- (void)setICloudDetailsPageInfo:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudDetailsPageInfo, a3);
}

- (NSURL)manageStorageURL
{
  return self->_manageStorageURL;
}

- (void)setManageStorageURL:(id)a3
{
  objc_storeStrong((id *)&self->_manageStorageURL, a3);
}

- (NSString)manageStorageTitle
{
  return self->_manageStorageTitle;
}

- (void)setManageStorageTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)manageStorageActionButtonText
{
  return self->_manageStorageActionButtonText;
}

- (void)setManageStorageActionButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (ICQManageStoragePageInfo)manageStoragePage
{
  return self->_manageStoragePage;
}

- (void)setManageStoragePage:(id)a3
{
  objc_storeStrong((id *)&self->_manageStoragePage, a3);
}

- (CERecommendationInfo)recommendationInfo
{
  return self->_recommendationInfo;
}

- (void)setRecommendationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationInfo, 0);
  objc_storeStrong((id *)&self->_manageStoragePage, 0);
  objc_storeStrong((id *)&self->_manageStorageActionButtonText, 0);
  objc_storeStrong((id *)&self->_manageStorageTitle, 0);
  objc_storeStrong((id *)&self->_manageStorageURL, 0);
  objc_storeStrong((id *)&self->_iCloudDetailsPageInfo, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_backupInfo, 0);
  objc_storeStrong((id *)&self->_tips, 0);
  objc_storeStrong((id *)&self->_mediaStorage, 0);
  objc_storeStrong((id *)&self->_commerceStorage, 0);
  objc_storeStrong((id *)&self->_freeStorage, 0);
  objc_storeStrong((id *)&self->_usedStorage, 0);
  objc_storeStrong((id *)&self->_totalStorage, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
}

@end
