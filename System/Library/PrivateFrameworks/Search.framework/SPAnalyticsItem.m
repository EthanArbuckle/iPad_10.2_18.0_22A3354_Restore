@implementation SPAnalyticsItem

- (SPAnalyticsItem)initWithResult:(id)a3
{
  id v4;
  SPAnalyticsItem *v5;
  uint64_t v6;
  NSString *applicationBundleIdentifier;
  uint64_t v8;
  NSString *sectionBundleIdentifier;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *contactIdentifier;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SPAnalyticsItem;
  v5 = -[SPAnalyticsItem init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "applicationBundleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "sectionBundleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    sectionBundleIdentifier = v5->_sectionBundleIdentifier;
    v5->_sectionBundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "contactIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v12;

    v5->_type = objc_msgSend(v4, "type");
    v5->_isLocalApplicationResult = objc_msgSend(v4, "isLocalApplicationResult");
    v5->_topHit = objc_msgSend(v4, "topHit");
    v5->_isStaticCorrection = objc_msgSend(v4, "isStaticCorrection");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "rankingItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "didMatchRankingDescriptor:", *MEMORY[0x24BEB0390]))
        v5->_isDisplayNameCorrectionsMatch = 1;
      objc_msgSend(v4, "launchString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        v5->_isLocalShortcut = 1;

    }
  }

  return v5;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)sectionBundleIdentifier
{
  return self->_sectionBundleIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (int)type
{
  return self->_type;
}

- (BOOL)isLocalShortcut
{
  return self->_isLocalShortcut;
}

- (void)setIsLocalShortcut:(BOOL)a3
{
  self->_isLocalShortcut = a3;
}

- (BOOL)isLocalApplicationResult
{
  return self->_isLocalApplicationResult;
}

- (void)setIsLocalApplicationResult:(BOOL)a3
{
  self->_isLocalApplicationResult = a3;
}

- (BOOL)isDisplayNameCorrectionsMatch
{
  return self->_isDisplayNameCorrectionsMatch;
}

- (void)setIsDisplayNameCorrectionsMatch:(BOOL)a3
{
  self->_isDisplayNameCorrectionsMatch = a3;
}

- (BOOL)isStaticCorrection
{
  return self->_isStaticCorrection;
}

- (void)setIsStaticCorrection:(BOOL)a3
{
  self->_isStaticCorrection = a3;
}

- (int)topHit
{
  return self->_topHit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

@end
