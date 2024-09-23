@implementation WBSSavedAccountMatchCriteria

+ (id)criteriaForExactFQDNPasswordMatchesOfURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:options:partialUsername:associatedDomainsManager:webFrameIdentifier:", v4, 16, &stru_1E64A2498, 0, 0);

  return v5;
}

+ (id)criteriaForNonAutofillablePasskeyWithCredentialIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:options:partialUsername:passkeyCredentialIdentifier:associatedDomainsManager:webFrameIdentifier:", 0, 48, &stru_1E64A2498, v4, 0, 0);

  return v5;
}

- (WBSSavedAccountMatchCriteria)initWithURL:(id)a3 options:(unint64_t)a4 partialUsername:(id)a5 associatedDomainsManager:(id)a6 webFrameIdentifier:(id)a7
{
  return -[WBSSavedAccountMatchCriteria initWithURL:options:partialUsername:passkeyCredentialIdentifier:associatedDomainsManager:webFrameIdentifier:](self, "initWithURL:options:partialUsername:passkeyCredentialIdentifier:associatedDomainsManager:webFrameIdentifier:", a3, a4, a5, 0, a6, a7);
}

- (WBSSavedAccountMatchCriteria)initWithURL:(id)a3 options:(unint64_t)a4 partialUsername:(id)a5 passkeyCredentialIdentifier:(id)a6 associatedDomainsManager:(id)a7 webFrameIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  WBSSavedAccountMatchCriteria *v19;
  uint64_t v20;
  NSURL *URL;
  uint64_t v22;
  NSString *partialUsername;
  uint64_t v24;
  WBSSavedAccountContext *context;
  uint64_t v26;
  NSData *passkeyCredentialIdentifier;
  WBSSavedAccountMatchCriteria *v28;
  objc_super v30;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)WBSSavedAccountMatchCriteria;
  v19 = -[WBSSavedAccountMatchCriteria init](&v30, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    URL = v19->_URL;
    v19->_URL = (NSURL *)v20;

    v19->_options = a4;
    v22 = objc_msgSend(v15, "copy");
    partialUsername = v19->_partialUsername;
    v19->_partialUsername = (NSString *)v22;

    objc_storeStrong((id *)&v19->_associatedDomainsManager, a7);
    +[WBSSavedAccountContext defaultContext](WBSSavedAccountContext, "defaultContext");
    v24 = objc_claimAutoreleasedReturnValue();
    context = v19->_context;
    v19->_context = (WBSSavedAccountContext *)v24;

    v26 = objc_msgSend(v16, "copy");
    passkeyCredentialIdentifier = v19->_passkeyCredentialIdentifier;
    v19->_passkeyCredentialIdentifier = (NSData *)v26;

    if ((a4 & 0x30) == 0)
      objc_storeStrong((id *)&v19->_webFrameIdentifier, a8);
    v28 = v19;
  }

  return v19;
}

- (BOOL)queryShouldReturnSavedAccountsMatchingHighLevelAndSimplifiedDomains
{
  return self->_options & 1;
}

- (BOOL)queryShouldReturnSavedAccountsMatchingAssociatedDomains
{
  return (self->_options & 2) != 0 && self->_associatedDomainsManager != 0;
}

- (BOOL)queryShouldReturnSavedAccountsWithEmptyUsernames
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)queryShouldOmitAutoFillPasskeyMatches
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (BOOL)queryShouldIncludePasskeyMatchesForNonAutoFillContext
{
  return (LOBYTE(self->_options) >> 5) & 1;
}

- (BOOL)queryShouldIncludeSavedAccountsWithDoNotSaveMarkers
{
  NSString *partialUsername;
  void *v3;

  if ((self->_options & 4) != 0)
    return 1;
  partialUsername = self->_partialUsername;
  +[WBSDontSaveMarker dontSaveMarker](WBSDontSaveMarker, "dontSaveMarker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(partialUsername) = -[NSString isEqualToString:](partialUsername, "isEqualToString:", v3);

  return (char)partialUsername;
}

- (NSSet)associatedDomainsForURL
{
  WBSAutoFillAssociatedDomainsManager *associatedDomainsManager;
  void *v4;
  void *v5;
  void *v6;

  if (-[WBSSavedAccountMatchCriteria queryShouldReturnSavedAccountsMatchingAssociatedDomains](self, "queryShouldReturnSavedAccountsMatchingAssociatedDomains"))
  {
    associatedDomainsManager = self->_associatedDomainsManager;
    -[NSURL host](self->_URL, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_stringByRemovingWwwDotPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSAutoFillAssociatedDomainsManager domainsWithAssociatedCredentialsForDomain:](associatedDomainsManager, "domainsWithAssociatedCredentialsForDomain:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSString *partialUsername;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)WBSSavedAccountMatchCriteria;
  -[WBSSavedAccountMatchCriteria description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL absoluteString](self->_URL, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  partialUsername = self->_partialUsername;
  -[WBSSavedAccountMatchCriteria _optionsDescription](self, "_optionsDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ url=%@ username='%@' options=%@ associatedDomains=%@ context=%@ passkeyCredentialID=%@ webFrameID=%@>"), v4, v5, partialUsername, v7, self->_associatedDomainsManager, self->_context, self->_passkeyCredentialIdentifier, self->_webFrameIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_optionsDescription
{
  void *v3;
  void *v4;
  unint64_t options;
  __CFString *v6;

  if (!self->_options)
  {
    v6 = CFSTR("none");
    return v6;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  options = self->_options;
  if ((options & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("highLevelAndSimplifiedDomains"));
    options = self->_options;
    if ((options & 2) == 0)
    {
LABEL_4:
      if ((options & 4) == 0)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  else if ((options & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v4, "addObject:", CFSTR("quirkAffiliatedDomains"));
  options = self->_options;
  if ((options & 4) == 0)
  {
LABEL_5:
    if ((options & 8) == 0)
      goto LABEL_6;
LABEL_14:
    objc_msgSend(v4, "addObject:", CFSTR("emptyUsername"));
    if ((self->_options & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  objc_msgSend(v4, "addObject:", CFSTR("doNotSave"));
  options = self->_options;
  if ((options & 8) != 0)
    goto LABEL_14;
LABEL_6:
  if ((options & 0x10) != 0)
LABEL_7:
    objc_msgSend(v4, "addObject:", CFSTR("autoFillPasskeys"));
LABEL_8:
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" | "));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)partialUsername
{
  return self->_partialUsername;
}

- (void)setPartialUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (WBSSavedAccountContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (WBSAutoFillAssociatedDomainsManager)associatedDomainsManager
{
  return self->_associatedDomainsManager;
}

- (void)setAssociatedDomainsManager:(id)a3
{
  objc_storeStrong((id *)&self->_associatedDomainsManager, a3);
}

- (NSData)passkeyCredentialIdentifier
{
  return self->_passkeyCredentialIdentifier;
}

- (void)setPasskeyCredentialIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (WBSGlobalFrameIdentifier)webFrameIdentifier
{
  return self->_webFrameIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webFrameIdentifier, 0);
  objc_storeStrong((id *)&self->_passkeyCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedDomainsManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_partialUsername, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
