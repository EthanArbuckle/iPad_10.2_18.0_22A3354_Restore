@implementation PKPaymentSetupProductCategory

- (PKPaymentSetupProductCategory)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentSetupProductCategory *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *localizedDisplayName;
  uint64_t v10;
  NSString *localizedTitle;
  uint64_t v12;
  NSString *localizedSubtitle;
  uint64_t v14;
  NSString *localizedSearchBarDefaultText;
  PKPaymentSetupProductImageAssetURLs *v16;
  void *v17;
  uint64_t v18;
  PKPaymentSetupProductImageAssetURLs *imageAssetURLs;
  PKPaymentSetupProductImageAssets *v20;
  PKPaymentSetupProductImageAssets *imageAssets;
  uint64_t v22;
  NSSet *productIdentifiers;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSSet *regions;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __CFString *v39;
  __CFString *v40;
  char v41;
  uint64_t v42;
  __CFString *v43;
  __CFString *v44;
  char v45;
  __CFString *v46;
  __CFString *v47;
  int v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSString *v52;
  __CFString *v53;
  PKPaymentSetupProductCategory *v54;
  uint64_t v55;
  NSString *v56;
  uint64_t v57;
  NSString *v58;
  uint64_t v59;
  __CFString *v60;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)PKPaymentSetupProductCategory;
  v5 = -[PKPaymentSetupProductCategory init](&v71, sel_init);
  if (!v5)
    goto LABEL_58;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDisplayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedSubtitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedSearchBarDefaultText"));
    v14 = objc_claimAutoreleasedReturnValue();
    localizedSearchBarDefaultText = v5->_localizedSearchBarDefaultText;
    v5->_localizedSearchBarDefaultText = (NSString *)v14;

    v16 = [PKPaymentSetupProductImageAssetURLs alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("imageAssets"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PKPaymentSetupProductImageAssetURLs initWithImageAssetsDictionary:](v16, "initWithImageAssetsDictionary:", v17);
    imageAssetURLs = v5->_imageAssetURLs;
    v5->_imageAssetURLs = (PKPaymentSetupProductImageAssetURLs *)v18;

    v20 = objc_alloc_init(PKPaymentSetupProductImageAssets);
    imageAssets = v5->_imageAssets;
    v5->_imageAssets = v20;

    objc_msgSend(v4, "PKSetForKey:", CFSTR("productIdentifiers"));
    v22 = objc_claimAutoreleasedReturnValue();
    productIdentifiers = v5->_productIdentifiers;
    v5->_productIdentifiers = (NSSet *)v22;

    v5->_allowOnManagedAccount = objc_msgSend(v4, "PKBoolForKey:", CFSTR("allowOnManagedAccount"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("region"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsSeparatedByString:", CFSTR(","));
    v25 = objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v25);
      v27 = objc_msgSend(v26, "copy");
      regions = v5->_regions;
      v5->_regions = (NSSet *)v27;

    }
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v4, "PKArrayForKey:", CFSTR("capabilities"), v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v68 != v32)
            objc_enumerationMutation(v29);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "isEqualToString:", CFSTR("nfc")))
            v5->_capabilities |= 1uLL;
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
      }
      while (v31);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend(v4, "PKArrayForKey:", CFSTR("excludedContexts"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v64;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v64 != v37)
            objc_enumerationMutation(v34);
          v39 = (__CFString *)*(id *)(*((_QWORD *)&v63 + 1) + 8 * v38);
          if (v39 == CFSTR("setupAssistant"))
            goto LABEL_22;
          v40 = v39;
          if (!v39)
            goto LABEL_24;
          v41 = -[__CFString isEqualToString:](v39, "isEqualToString:", CFSTR("setupAssistant"));

          if ((v41 & 1) != 0)
          {
LABEL_22:
            v42 = 1;
LABEL_23:
            v5->_excludedContexts |= v42;
            goto LABEL_24;
          }
          v43 = v40;
          if (v43 == CFSTR("watch")
            || (v44 = v43,
                v45 = -[__CFString isEqualToString:](v43, "isEqualToString:", CFSTR("watch")),
                v44,
                (v45 & 1) != 0))
          {
            v42 = 2;
            goto LABEL_23;
          }
          v46 = v44;
          if (v46 == CFSTR("merchantApp")
            || (v47 = v46,
                v48 = -[__CFString isEqualToString:](v46, "isEqualToString:", CFSTR("merchantApp")),
                v47,
                v48))
          {
            v42 = 4;
            goto LABEL_23;
          }
LABEL_24:
          ++v38;
        }
        while (v36 != v38);
        v49 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
        v36 = v49;
      }
      while (v49);
    }

    if (-[NSString isEqualToString:](v5->_identifier, "isEqualToString:", CFSTR("creditDebit")))
    {
      v50 = v62;
      if (!v5->_localizedTitle)
      {
        PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_CREDIT_DEBIT_TITLE"), 0);
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = v5->_localizedTitle;
        v5->_localizedTitle = (NSString *)v51;

      }
      if (v5->_localizedSearchBarDefaultText)
        goto LABEL_57;
      v53 = CFSTR("PAYMENT_SETUP_CREDIT_DEBIT_SEARCH_DEFAULT");
      goto LABEL_44;
    }
    v50 = v62;
    if (-[NSString isEqualToString:](v5->_identifier, "isEqualToString:", CFSTR("transit")))
    {
      if (!v5->_localizedTitle)
      {
        PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_RIDE_TRANSIT"), 0);
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = v5->_localizedTitle;
        v5->_localizedTitle = (NSString *)v55;

      }
      if (v5->_localizedSearchBarDefaultText)
        goto LABEL_57;
      v53 = CFSTR("PAYMENT_SETUP_RIDE_TRANSIT_SEARCH_DEFAULT");
LABEL_44:
      PKLocalizedPaymentString(&v53->isa, 0);
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = v5->_localizedSearchBarDefaultText;
      v5->_localizedSearchBarDefaultText = (NSString *)v57;
LABEL_56:

      goto LABEL_57;
    }
    if (-[NSString isEqualToString:](v5->_identifier, "isEqualToString:", CFSTR("identity")))
    {
      if (!v5->_localizedTitle)
      {
        PKLocalizedIdentityString(CFSTR("PAYMENT_SETUP_IDENTITY_TITLE"), 0);
        v59 = objc_claimAutoreleasedReturnValue();
LABEL_55:
        v58 = v5->_localizedTitle;
        v5->_localizedTitle = (NSString *)v59;
        goto LABEL_56;
      }
LABEL_57:

LABEL_58:
      v54 = v5;
      goto LABEL_59;
    }
    if (-[NSString isEqualToString:](v5->_identifier, "isEqualToString:", CFSTR("eMoney")))
    {
      if (v5->_localizedTitle)
        goto LABEL_57;
      v60 = CFSTR("PAYMENT_SETUP_EMONEY_TITLE");
    }
    else
    {
      if (!-[NSString isEqualToString:](v5->_identifier, "isEqualToString:", CFSTR("carKey")) || v5->_localizedTitle)
        goto LABEL_57;
      v60 = CFSTR("PAYMENT_SETUP_CARKEY_TITLE");
    }
    PKLocalizedPaymentString(&v60->isa, 0);
    v59 = objc_claimAutoreleasedReturnValue();
    goto LABEL_55;
  }
  v54 = 0;
LABEL_59:

  return v54;
}

- (id)localizedSubtitleWithIsBridge:(BOOL)a3
{
  NSString *localizedSubtitle;
  NSString *v4;
  _BOOL4 v5;
  __CFString *v7;

  localizedSubtitle = self->_localizedSubtitle;
  if (localizedSubtitle)
  {
    v4 = localizedSubtitle;
  }
  else
  {
    v5 = a3;
    if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("creditDebit")))
    {
      v7 = CFSTR("PAYMENT_SETUP_CREDIT_DEBIT_SUBTITLE");
    }
    else if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("transit")))
    {
      if (v5)
      {
        v7 = CFSTR("PAYMENT_SETUP_TRANSIT_SUBTITLE_WATCH");
      }
      else if (PKIsPairedWithWatch())
      {
        v7 = CFSTR("PAYMENT_SETUP_TRANSIT_SUBTITLE_PHONE_WATCH");
      }
      else
      {
        v7 = CFSTR("PAYMENT_SETUP_TRANSIT_SUBTITLE_PHONE");
      }
    }
    else
    {
      if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("identity")))
      {
        PKLocalizedIdentityString(CFSTR("PAYMENT_SETUP_IDENTITY_SUBTITLE"), 0);
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("eMoney")))
      {
        v7 = CFSTR("PAYMENT_SETUP_EMONEY_SUBTITLE");
      }
      else
      {
        if (!-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("carKey")))
        {
          v4 = 0;
          return v4;
        }
        v7 = CFSTR("PAYMENT_SETUP_CARKEY_SUBTITLE");
      }
    }
    PKLocalizedPaymentString(&v7->isa, 0);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("localizedDisplayName: '%@'; "), self->_localizedDisplayName);
  objc_msgSend(v3, "appendFormat:", CFSTR("productIdentifiers: '%@'; "), self->_productIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)needsProducts
{
  if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("yourCards"))
    || -[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("appExtensions")))
  {
    return 0;
  }
  else
  {
    return !-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("creditDebit"));
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSearchBarDefaultText
{
  return self->_localizedSearchBarDefaultText;
}

- (unint64_t)excludedContexts
{
  return self->_excludedContexts;
}

- (void)setExcludedContexts:(unint64_t)a3
{
  self->_excludedContexts = a3;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (PKPaymentSetupProductImageAssetURLs)imageAssetURLs
{
  return self->_imageAssetURLs;
}

- (void)setImageAssetURLs:(id)a3
{
  objc_storeStrong((id *)&self->_imageAssetURLs, a3);
}

- (PKPaymentSetupProductImageAssets)imageAssets
{
  return self->_imageAssets;
}

- (void)setImageAssets:(id)a3
{
  objc_storeStrong((id *)&self->_imageAssets, a3);
}

- (BOOL)allowOnManagedAccount
{
  return self->_allowOnManagedAccount;
}

- (NSSet)productIdentifiers
{
  return self->_productIdentifiers;
}

- (void)setProductIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIdentifiers, 0);
  objc_storeStrong((id *)&self->_imageAssets, 0);
  objc_storeStrong((id *)&self->_imageAssetURLs, 0);
  objc_storeStrong((id *)&self->_localizedSearchBarDefaultText, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
}

@end
