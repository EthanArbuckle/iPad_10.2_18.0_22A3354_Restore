@implementation PKDynamicProvisioningPageContent

- (PKDynamicProvisioningPageContent)initWithDictonary:(id)a3
{
  id v4;
  PKDynamicProvisioningPageContent *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *identifier;
  NSString **p_identifier;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  NSString *subtitle;
  uint64_t v19;
  NSString *v20;
  uint64_t v21;
  NSString *v22;
  uint64_t v23;
  NSString *altSubtitle;
  uint64_t v25;
  NSString *v26;
  uint64_t v27;
  NSString *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  NSString *v33;
  NSString *body;
  void *v35;
  void *v36;
  NSString *v37;
  NSString *footnote;
  void *v39;
  void *v40;
  NSString *v41;
  NSString *footnoteDisclosure;
  void *v43;
  void *v44;
  NSString *v45;
  NSString *primaryActionTitle;
  void *v47;
  void *v48;
  NSString *v49;
  NSString *altPrimaryActionTitle;
  void *v51;
  void *v52;
  NSString *v53;
  NSString *primaryActionIdentifier;
  void *v55;
  void *v56;
  NSString *v57;
  NSString *secondaryActionTitle;
  void *v59;
  void *v60;
  NSString *v61;
  NSString *secondaryActionIdentifier;
  void *v63;
  void *v64;
  NSString *v65;
  NSString *disclosureTitle;
  __CFString *v67;
  __CFString *v68;
  char v69;
  uint64_t v70;
  __CFString *v71;
  __CFString *v72;
  int v73;
  NSObject *v74;
  double v75;
  __CFString *v76;
  __CFString *v77;
  uint64_t v78;
  NSString *heroImageURL;
  NSObject *v80;
  NSString *v81;
  void *v82;
  PKDynamicProvisioningPageLearnMoreContent *v83;
  PKDynamicProvisioningPageLearnMoreContent *learnMore;
  void *v85;
  PKDynamicProvisioningPageLearnMoreContent *v86;
  PKDynamicProvisioningPageLearnMoreContent *secondaryActionItem;
  void *v88;
  PKDynamicProvisioningPageContent *v89;
  PKDynamicProvisioningPageContent *loadingPageContent;
  void *v91;
  PKApplyActionContent *v92;
  PKApplyActionContent *actionContent;
  void *v94;
  PKApplyFooterContent *v95;
  PKApplyFooterContent *footerContent;
  NSString *v98;
  objc_super v99;
  uint8_t buf[4];
  NSString *v101;
  __int16 v102;
  __CFString *v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v99.receiver = self;
  v99.super_class = (Class)PKDynamicProvisioningPageContent;
  v5 = -[PKDynamicProvisioningPageContent init](&v99, sel_init);
  if (!v5)
    goto LABEL_73;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextIdentifier"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  p_identifier = &v5->_identifier;
  identifier = v5->_identifier;
  v5->_identifier = v8;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("title"));
  v11 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v11;

  if (!v5->_title)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextLocalizedTitle"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v5->_title;
    v5->_title = (NSString *)v13;

    if (!v5->_title)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedTitle"));
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v5->_title;
      v5->_title = (NSString *)v15;

    }
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("description"));
  v17 = objc_claimAutoreleasedReturnValue();
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v17;

  if (!v5->_subtitle)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextLocalizedDescription"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v5->_subtitle;
    v5->_subtitle = (NSString *)v19;

    if (!v5->_subtitle)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDescription"));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v5->_subtitle;
      v5->_subtitle = (NSString *)v21;

    }
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("altDescription"));
  v23 = objc_claimAutoreleasedReturnValue();
  altSubtitle = v5->_altSubtitle;
  v5->_altSubtitle = (NSString *)v23;

  if (!v5->_altSubtitle)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextLocalizedAltDescription"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v5->_altSubtitle;
    v5->_altSubtitle = (NSString *)v25;

    if (!v5->_altSubtitle)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedAltDescription"));
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v5->_altSubtitle;
      v5->_altSubtitle = (NSString *)v27;

    }
  }
  v5->_altSubtitleTimeInterval = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("contextAltDescriptionTimeInterval"));
  objc_msgSend(v4, "PKStringForKey:", CFSTR("contentAlingment"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "isEqualToString:", CFSTR("natual")))
    v30 = 4;
  else
    v30 = 2;
  v5->_contentAlignment = v30;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("body"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    v33 = v31;
  }
  else
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextLocalizedBody"));
    v33 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  body = v5->_body;
  v5->_body = v33;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("footnote"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    v37 = v35;
  }
  else
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextLocalizedFootnote"));
    v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  footnote = v5->_footnote;
  v5->_footnote = v37;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("footnoteDisclosure"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    v41 = v39;
  }
  else
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextLocalizedFootnoteDisclosure"));
    v41 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  footnoteDisclosure = v5->_footnoteDisclosure;
  v5->_footnoteDisclosure = v41;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("primaryActionTitle"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    v45 = v43;
  }
  else
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextLocalizedPrimaryActionTitle"));
    v45 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  primaryActionTitle = v5->_primaryActionTitle;
  v5->_primaryActionTitle = v45;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("altPrimaryActionTitle"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47)
  {
    v49 = v47;
  }
  else
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextLocalizedAltPrimaryActionTitle"));
    v49 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  altPrimaryActionTitle = v5->_altPrimaryActionTitle;
  v5->_altPrimaryActionTitle = v49;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("primaryActionIdentifier"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51)
  {
    v53 = v51;
  }
  else
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextPrimaryActionIdentifier"));
    v53 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  primaryActionIdentifier = v5->_primaryActionIdentifier;
  v5->_primaryActionIdentifier = v53;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("secondaryActionTitle"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
  {
    v57 = v55;
  }
  else
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextLocalizedSecondaryActionTitle"));
    v57 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  secondaryActionTitle = v5->_secondaryActionTitle;
  v5->_secondaryActionTitle = v57;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("secondaryActionIdentifier"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (v59)
  {
    v61 = v59;
  }
  else
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextSecondaryActionIdentifier"));
    v61 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  secondaryActionIdentifier = v5->_secondaryActionIdentifier;
  v5->_secondaryActionIdentifier = v61;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("disclosureTitle"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if (v63)
  {
    v65 = v63;
  }
  else
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextDisclosureTitle"));
    v65 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  disclosureTitle = v5->_disclosureTitle;
  v5->_disclosureTitle = v65;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("layout"));
  v67 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v68 = v67;
  if (v67 == CFSTR("default"))
    goto LABEL_47;
  if (!v67)
    goto LABEL_51;
  v69 = -[__CFString isEqualToString:](v67, "isEqualToString:", CFSTR("default"));

  if ((v69 & 1) != 0)
  {
LABEL_47:
    v70 = 1;
    goto LABEL_52;
  }
  v71 = v68;
  if (v71 == CFSTR("compact")
    || (v72 = v71,
        v73 = -[__CFString isEqualToString:](v71, "isEqualToString:", CFSTR("compact")),
        v72,
        v73))
  {
    v70 = 2;
  }
  else
  {
LABEL_51:
    v70 = 0;
  }
LABEL_52:

  v5->_layout = v70;
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("heroImage"));
  v74 = objc_claimAutoreleasedReturnValue();
  if (v74
    || (objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("contextHeroImage")),
        (v74 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v75 = PKScreenScale();
    v76 = CFSTR("2x");
    if (v75 > 2.0)
      v76 = CFSTR("3x");
    v77 = v76;
    -[NSObject PKStringForKey:](v74, "PKStringForKey:", v77);
    v78 = objc_claimAutoreleasedReturnValue();
    heroImageURL = v5->_heroImageURL;
    v5->_heroImageURL = (NSString *)v78;

    if (!v5->_heroImageURL)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        v81 = *p_identifier;
        *(_DWORD *)buf = 138412546;
        v101 = v81;
        v102 = 2112;
        v103 = v77;
        _os_log_impl(&dword_18FC92000, v80, OS_LOG_TYPE_DEFAULT, "No valid imageURL found for identifier: %@ with scale: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v98 = *p_identifier;
      *(_DWORD *)buf = 138412290;
      v101 = v98;
      _os_log_impl(&dword_18FC92000, v74, OS_LOG_TYPE_DEFAULT, "No imageURLs specified for identifier: %@", buf, 0xCu);
    }
  }

  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("learnMore"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82
    || (objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("contextLearnMore")),
        (v82 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v83 = -[PKDynamicProvisioningPageLearnMoreContent initWithDictionary:]([PKDynamicProvisioningPageLearnMoreContent alloc], "initWithDictionary:", v82);
    learnMore = v5->_learnMore;
    v5->_learnMore = v83;

  }
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("secondaryActionItem"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    v86 = -[PKDynamicProvisioningPageLearnMoreContent initWithDictionary:]([PKDynamicProvisioningPageLearnMoreContent alloc], "initWithDictionary:", v85);
    secondaryActionItem = v5->_secondaryActionItem;
    v5->_secondaryActionItem = v86;

  }
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("contextLoading"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = -[PKDynamicProvisioningPageContent initWithDictonary:]([PKDynamicProvisioningPageContent alloc], "initWithDictonary:", v88);
    loadingPageContent = v5->_loadingPageContent;
    v5->_loadingPageContent = v89;

  }
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("actionContent"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v91, "count"))
  {
    v92 = -[PKApplyActionContent initWithDictionary:]([PKApplyActionContent alloc], "initWithDictionary:", v91);
    actionContent = v5->_actionContent;
    v5->_actionContent = v92;

  }
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("footerContent"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v94, "count"))
  {
    v95 = -[PKApplyFooterContent initWithDictionary:]([PKApplyFooterContent alloc], "initWithDictionary:", v94);
    footerContent = v5->_footerContent;
    v5->_footerContent = v95;

  }
LABEL_73:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKDynamicProvisioningPageContent *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  uint64_t v12;
  NSString *altSubtitle;
  uint64_t v14;
  NSString *body;
  uint64_t v16;
  NSString *footnote;
  uint64_t v18;
  NSString *footnoteDisclosure;
  uint64_t v20;
  NSString *primaryActionTitle;
  uint64_t v22;
  NSString *altPrimaryActionTitle;
  uint64_t v24;
  NSString *primaryActionIdentifier;
  uint64_t v26;
  NSString *secondaryActionTitle;
  uint64_t v28;
  NSString *secondaryActionIdentifier;
  uint64_t v30;
  NSString *disclosureTitle;
  PKDynamicProvisioningPageLearnMoreContent *v32;
  PKDynamicProvisioningPageLearnMoreContent *learnMore;
  PKDynamicProvisioningPageLearnMoreContent *v34;
  PKDynamicProvisioningPageLearnMoreContent *secondaryActionItem;
  uint64_t v36;
  NSString *heroImageURL;
  PKApplyFooterContent *v38;
  PKApplyFooterContent *footerContent;
  PKApplyActionContent *v40;
  PKApplyActionContent *actionContent;
  PKDynamicProvisioningPageContent *v42;
  PKDynamicProvisioningPageContent *loadingPageContent;

  v5 = -[PKDynamicProvisioningPageContent init](+[PKDynamicProvisioningPageContent allocWithZone:](PKDynamicProvisioningPageContent, "allocWithZone:"), "init");
  v5->_pageNumber = self->_pageNumber;
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  title = v5->_title;
  v5->_title = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_altSubtitle, "copyWithZone:", a3);
  altSubtitle = v5->_altSubtitle;
  v5->_altSubtitle = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_body, "copyWithZone:", a3);
  body = v5->_body;
  v5->_body = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_footnote, "copyWithZone:", a3);
  footnote = v5->_footnote;
  v5->_footnote = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_footnoteDisclosure, "copyWithZone:", a3);
  footnoteDisclosure = v5->_footnoteDisclosure;
  v5->_footnoteDisclosure = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_primaryActionTitle, "copyWithZone:", a3);
  primaryActionTitle = v5->_primaryActionTitle;
  v5->_primaryActionTitle = (NSString *)v20;

  v22 = -[NSString copyWithZone:](self->_altPrimaryActionTitle, "copyWithZone:", a3);
  altPrimaryActionTitle = v5->_altPrimaryActionTitle;
  v5->_altPrimaryActionTitle = (NSString *)v22;

  v24 = -[NSString copyWithZone:](self->_primaryActionIdentifier, "copyWithZone:", a3);
  primaryActionIdentifier = v5->_primaryActionIdentifier;
  v5->_primaryActionIdentifier = (NSString *)v24;

  v26 = -[NSString copyWithZone:](self->_secondaryActionTitle, "copyWithZone:", a3);
  secondaryActionTitle = v5->_secondaryActionTitle;
  v5->_secondaryActionTitle = (NSString *)v26;

  v28 = -[NSString copyWithZone:](self->_secondaryActionIdentifier, "copyWithZone:", a3);
  secondaryActionIdentifier = v5->_secondaryActionIdentifier;
  v5->_secondaryActionIdentifier = (NSString *)v28;

  v30 = -[NSString copyWithZone:](self->_disclosureTitle, "copyWithZone:", a3);
  disclosureTitle = v5->_disclosureTitle;
  v5->_disclosureTitle = (NSString *)v30;

  v32 = -[PKDynamicProvisioningPageLearnMoreContent copyWithZone:](self->_learnMore, "copyWithZone:", a3);
  learnMore = v5->_learnMore;
  v5->_learnMore = v32;

  v34 = -[PKDynamicProvisioningPageLearnMoreContent copyWithZone:](self->_secondaryActionItem, "copyWithZone:", a3);
  secondaryActionItem = v5->_secondaryActionItem;
  v5->_secondaryActionItem = v34;

  v36 = -[NSString copyWithZone:](self->_heroImageURL, "copyWithZone:", a3);
  heroImageURL = v5->_heroImageURL;
  v5->_heroImageURL = (NSString *)v36;

  v38 = -[PKApplyFooterContent copyWithZone:](self->_footerContent, "copyWithZone:", a3);
  footerContent = v5->_footerContent;
  v5->_footerContent = v38;

  v40 = -[PKApplyActionContent copyWithZone:](self->_actionContent, "copyWithZone:", a3);
  actionContent = v5->_actionContent;
  v5->_actionContent = v40;

  v42 = -[PKDynamicProvisioningPageContent copyWithZone:](self->_loadingPageContent, "copyWithZone:", a3);
  loadingPageContent = v5->_loadingPageContent;
  v5->_loadingPageContent = v42;

  v5->_contentAlignment = self->_contentAlignment;
  v5->_layout = self->_layout;
  v5->_altSubtitleTimeInterval = self->_altSubtitleTimeInterval;
  return v5;
}

- (BOOL)isEmptyPage
{
  return !self->_title && !self->_subtitle && self->_body == 0;
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->_pageNumber = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)altSubtitle
{
  return self->_altSubtitle;
}

- (void)setAltSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)altSubtitleTimeInterval
{
  return self->_altSubtitleTimeInterval;
}

- (void)setAltSubtitleTimeInterval:(unint64_t)a3
{
  self->_altSubtitleTimeInterval = a3;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)footnoteDisclosure
{
  return self->_footnoteDisclosure;
}

- (void)setFootnoteDisclosure:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (void)setPrimaryActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)altPrimaryActionTitle
{
  return self->_altPrimaryActionTitle;
}

- (void)setAltPrimaryActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)primaryActionIdentifier
{
  return self->_primaryActionIdentifier;
}

- (void)setPrimaryActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)secondaryActionTitle
{
  return self->_secondaryActionTitle;
}

- (void)setSecondaryActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)secondaryActionIdentifier
{
  return self->_secondaryActionIdentifier;
}

- (void)setSecondaryActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)disclosureTitle
{
  return self->_disclosureTitle;
}

- (void)setDisclosureTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)heroImageURL
{
  return self->_heroImageURL;
}

- (void)setHeroImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_heroImageURL, a3);
}

- (PKDynamicProvisioningPageLearnMoreContent)learnMore
{
  return self->_learnMore;
}

- (void)setLearnMore:(id)a3
{
  objc_storeStrong((id *)&self->_learnMore, a3);
}

- (PKDynamicProvisioningPageLearnMoreContent)secondaryActionItem
{
  return self->_secondaryActionItem;
}

- (void)setSecondaryActionItem:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryActionItem, a3);
}

- (PKDynamicProvisioningPageContent)loadingPageContent
{
  return self->_loadingPageContent;
}

- (void)setLoadingPageContent:(id)a3
{
  objc_storeStrong((id *)&self->_loadingPageContent, a3);
}

- (PKApplyActionContent)actionContent
{
  return self->_actionContent;
}

- (void)setActionContent:(id)a3
{
  objc_storeStrong((id *)&self->_actionContent, a3);
}

- (PKApplyFooterContent)footerContent
{
  return self->_footerContent;
}

- (void)setFooterContent:(id)a3
{
  objc_storeStrong((id *)&self->_footerContent, a3);
}

- (unint64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(unint64_t)a3
{
  self->_layout = a3;
}

- (unsigned)contentAlignment
{
  return self->_contentAlignment;
}

- (void)setContentAlignment:(unsigned __int8)a3
{
  self->_contentAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerContent, 0);
  objc_storeStrong((id *)&self->_actionContent, 0);
  objc_storeStrong((id *)&self->_loadingPageContent, 0);
  objc_storeStrong((id *)&self->_secondaryActionItem, 0);
  objc_storeStrong((id *)&self->_learnMore, 0);
  objc_storeStrong((id *)&self->_heroImageURL, 0);
  objc_storeStrong((id *)&self->_disclosureTitle, 0);
  objc_storeStrong((id *)&self->_secondaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_altPrimaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_footnoteDisclosure, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_altSubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
