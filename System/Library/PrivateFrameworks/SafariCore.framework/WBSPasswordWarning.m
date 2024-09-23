@implementation WBSPasswordWarning

- (WBSPasswordWarning)initWithSavedAccount:(id)a3 issueTypes:(unint64_t)a4 weakPasswordEvaluation:(id)a5 titlesOfSavedAccountsWithReusedPassword:(id)a6 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  WBSPasswordWarning *v16;
  WBSPasswordWarning *v17;
  uint64_t v18;
  NSArray *titlesOfSavedAccountsWithReusedPassword;
  WBSPasswordWarning *v20;
  objc_super v22;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)WBSPasswordWarning;
  v16 = -[WBSPasswordWarning init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_savedAccount, a3);
    v17->_issueTypes = a4;
    objc_storeStrong((id *)&v17->_weakPasswordEvaluation, a5);
    v18 = objc_msgSend(v15, "copy");
    titlesOfSavedAccountsWithReusedPassword = v17->_titlesOfSavedAccountsWithReusedPassword;
    v17->_titlesOfSavedAccountsWithReusedPassword = (NSArray *)v18;

    v17->_savedAccountIsOnlySavedAccountForHighLevelDomain = a7;
    v20 = v17;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  WBSPasswordWarning *v4;
  WBSPasswordWarning *v5;
  BOOL v6;

  v4 = (WBSPasswordWarning *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[WBSSavedAccount isEqual:](self->_savedAccount, "isEqual:", v5->_savedAccount)
        && self->_issueTypes == v5->_issueTypes
        && -[WBSPasswordEvaluation isEqual:](self->_weakPasswordEvaluation, "isEqual:", v5->_weakPasswordEvaluation)
        && self->_savedAccountIsOnlySavedAccountForHighLevelDomain == v5->_savedAccountIsOnlySavedAccountForHighLevelDomain;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = self->_issueTypes ^ -[WBSSavedAccount hash](self->_savedAccount, "hash");
  return v3 ^ -[WBSPasswordEvaluation hash](self->_weakPasswordEvaluation, "hash") ^ self->_savedAccountIsOnlySavedAccountForHighLevelDomain;
}

- (unint64_t)severity
{
  if (!self->_issueTypes)
    return 0;
  if (self->_severityScore > 9)
    return 1;
  return 2;
}

- (BOOL)shouldShowWarningsWhenLoggingIn
{
  return -[WBSPasswordWarning hasBeenCompromised](self, "hasBeenCompromised")
      || -[WBSPasswordEvaluation userShouldBeShownActiveWarning](self->_weakPasswordEvaluation, "userShouldBeShownActiveWarning");
}

- (NSString)localizedShortDescriptivePhrase
{
  return (NSString *)-[WBSPasswordWarning _localizedShortDescriptionWithFullDescriptivePhrase:shouldDescribeMultipleIssues:](self, "_localizedShortDescriptionWithFullDescriptivePhrase:shouldDescribeMultipleIssues:", 1, +[WBSFeatureAvailability isPasswordManagerAppEnabledAndInstalled](WBSFeatureAvailability, "isPasswordManagerAppEnabledAndInstalled") ^ 1);
}

- (NSString)localizedShortDescriptionOfProblemType
{
  return (NSString *)-[WBSPasswordWarning _localizedShortDescriptionWithFullDescriptivePhrase:shouldDescribeMultipleIssues:](self, "_localizedShortDescriptionWithFullDescriptivePhrase:shouldDescribeMultipleIssues:", 0, +[WBSFeatureAvailability isPasswordManagerAppEnabledAndInstalled](WBSFeatureAvailability, "isPasswordManagerAppEnabledAndInstalled") ^ 1);
}

- (id)_localizedShortDescriptionWithFullDescriptivePhrase:(BOOL)a3 shouldDescribeMultipleIssues:(BOOL)a4
{
  if (a4)
    -[WBSPasswordWarning _localizedShortDescriptionOfMultipleIssuesWithFullDescriptivePhrase:](self, "_localizedShortDescriptionOfMultipleIssuesWithFullDescriptivePhrase:", a3);
  else
    -[WBSPasswordWarning _localizedShortDescriptionOfSingleIssueWithFullDescriptivePhrase:](self, "_localizedShortDescriptionOfSingleIssueWithFullDescriptivePhrase:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_localizedShortDescriptionOfMultipleIssuesWithFullDescriptivePhrase:(BOOL)a3
{
  unint64_t issueTypes;
  __CFString *v4;

  issueTypes = self->_issueTypes;
  if ((issueTypes & 0xC) == 0)
  {
    if ((~(_BYTE)issueTypes & 3) == 0)
    {
      if (a3)
        v4 = CFSTR("Easily guessed, reused password");
      else
        v4 = CFSTR("Easily guessed, reused");
      goto LABEL_34;
    }
    if ((issueTypes & 2) != 0)
    {
      if (a3)
        v4 = CFSTR("Easily guessed password");
      else
        v4 = CFSTR("Easily guessed");
      goto LABEL_34;
    }
    if ((issueTypes & 1) != 0)
    {
      if (a3)
        v4 = CFSTR("Reused password");
      else
        v4 = CFSTR("Reused");
      goto LABEL_34;
    }
    if ((~(_BYTE)issueTypes & 0x30) != 0)
    {
      if ((issueTypes & 0x10) != 0)
      {
        if (a3)
        {
          v4 = CFSTR("Previously shared password");
          goto LABEL_34;
        }
      }
      else
      {
        if ((issueTypes & 0x20) == 0)
          return 0;
        if (a3)
        {
          v4 = CFSTR("Previously shared passkey");
          goto LABEL_34;
        }
      }
    }
    else if (a3)
    {
      v4 = CFSTR("Previously shared passkey and password");
      goto LABEL_34;
    }
    v4 = CFSTR("Previously shared");
    goto LABEL_34;
  }
  if ((~(_BYTE)issueTypes & 0x30) != 0)
  {
    if ((issueTypes & 0x10) != 0)
    {
      if (a3)
      {
        v4 = CFSTR("Compromised, previously shared password");
        goto LABEL_34;
      }
    }
    else
    {
      if ((issueTypes & 0x20) == 0)
      {
        if ((issueTypes & 1) != 0)
        {
          if (a3)
            v4 = CFSTR("Compromised, reused password");
          else
            v4 = CFSTR("Compromised, reused");
        }
        else if ((issueTypes & 2) != 0)
        {
          if (a3)
            v4 = CFSTR("Compromised, easily guessed password");
          else
            v4 = CFSTR("Compromised, easily guessed");
        }
        else if (a3)
        {
          v4 = CFSTR("Compromised password");
        }
        else
        {
          v4 = CFSTR("Compromised");
        }
        goto LABEL_34;
      }
      if (a3)
      {
        v4 = CFSTR("Compromised password, previously shared passkey");
        goto LABEL_34;
      }
    }
LABEL_33:
    v4 = CFSTR("Compromised, previously shared");
    goto LABEL_34;
  }
  if (!a3)
    goto LABEL_33;
  v4 = CFSTR("Compromised password, previously shared passkey and password");
LABEL_34:
  _WBSLocalizedString(v4, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_localizedShortDescriptionOfSingleIssueWithFullDescriptivePhrase:(BOOL)a3
{
  unint64_t issueTypes;
  __CFString *v4;

  issueTypes = self->_issueTypes;
  if ((issueTypes & 0xC) != 0)
  {
    if (a3)
      v4 = CFSTR("Compromised password");
    else
      v4 = CFSTR("Compromised");
    goto LABEL_25;
  }
  if ((issueTypes & 2) != 0)
  {
    if (a3)
      v4 = CFSTR("Easily guessed password");
    else
      v4 = CFSTR("Easily guessed");
    goto LABEL_25;
  }
  if ((issueTypes & 1) != 0)
  {
    if (a3)
      v4 = CFSTR("Reused password");
    else
      v4 = CFSTR("Reused");
    goto LABEL_25;
  }
  if ((~(_BYTE)issueTypes & 0x30) != 0)
  {
    if ((issueTypes & 0x10) != 0)
    {
      if (a3)
      {
        v4 = CFSTR("Previously shared password");
        goto LABEL_25;
      }
    }
    else
    {
      if ((issueTypes & 0x20) == 0)
        return 0;
      if (a3)
      {
        v4 = CFSTR("Previously shared passkey");
        goto LABEL_25;
      }
    }
LABEL_24:
    v4 = CFSTR("Previously shared");
    goto LABEL_25;
  }
  if (!a3)
    goto LABEL_24;
  v4 = CFSTR("Previously shared passkey and password");
LABEL_25:
  _WBSLocalizedString(v4, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)_passwordVisibilityForClient:(unint64_t)a3
{
  return 2 * (a3 == 2);
}

- (id)_localizedLongWarningStringsForClient:(unint64_t)a3
{
  id v5;
  unint64_t issueTypes;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  issueTypes = self->_issueTypes;
  if ((issueTypes & 8) != 0)
  {
    _WBSLocalizedString(CFSTR("This password has appeared in a data leak, which puts this account at high risk of compromise."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

    issueTypes = self->_issueTypes;
  }
  if ((issueTypes & 4) != 0)
  {
    _WBSLocalizedString(CFSTR("Many people use this password, which makes it easy to guess."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  v9 = objc_msgSend(v5, "count");
  v10 = self->_issueTypes;
  if (v9)
    v11 = 1;
  else
    v11 = (self->_issueTypes & 2) == 0;
  if (!v11)
  {
    -[WBSPasswordEvaluation userFeedbackStringWithPasswordVisibility:](self->_weakPasswordEvaluation, "userFeedbackStringWithPasswordVisibility:", -[WBSPasswordWarning _passwordVisibilityForClient:](self, "_passwordVisibilityForClient:", a3));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v5, "addObject:", v12);

    v10 = self->_issueTypes;
  }
  if ((v10 & 0x30) != 0)
    -[WBSPasswordWarning _addFormerlySharedWarningStringToWarningStrings:](self, "_addFormerlySharedWarningStringToWarningStrings:", v5);
  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
    -[WBSPasswordWarning _addReusedWarningStringToWarningStrings:](self, "_addReusedWarningStringToWarningStrings:", v5);
  if (objc_msgSend(v5, "count"))
    v13 = v5;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (void)_addReusedWarningStringToWarningStrings:(id)a3
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  NSArray *titlesOfSavedAccountsWithReusedPassword;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  switch(-[NSArray count](self->_titlesOfSavedAccountsWithReusedPassword, "count"))
  {
    case 0uLL:
      goto LABEL_21;
    case 1uLL:
      v4 = objc_msgSend(v23, "count");
      v5 = (void *)MEMORY[0x1E0CB3940];
      if (v4)
        v6 = CFSTR("You’re also reusing this password on “%@”, which increases the risk to this account if your “%@” account is compromised.");
      else
        v6 = CFSTR("You’re reusing this password on “%@”, which increases the risk to this account if your “%@” account is compromised.");
      _WBSLocalizedString(v6, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      titlesOfSavedAccountsWithReusedPassword = self->_titlesOfSavedAccountsWithReusedPassword;
      v18 = 0;
      goto LABEL_16;
    case 2uLL:
      v10 = objc_msgSend(v23, "count");
      v5 = (void *)MEMORY[0x1E0CB3940];
      if (v10)
        v11 = CFSTR("You’re also reusing this password on “%@” and “%@”, which increases the risk to this account if one of those accounts is compromised.");
      else
        v11 = CFSTR("You’re reusing this password on “%@” and “%@”, which increases the risk to this account if one of those accounts is compromised.");
      _WBSLocalizedString(v11, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      titlesOfSavedAccountsWithReusedPassword = self->_titlesOfSavedAccountsWithReusedPassword;
      v18 = 1;
LABEL_16:
      -[NSArray objectAtIndexedSubscript:](titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v15, v16, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 3uLL:
      v12 = objc_msgSend(v23, "count");
      v13 = (void *)MEMORY[0x1E0CB3940];
      if (v12)
        v14 = CFSTR("You’re also reusing this password on “%@”, “%@”, and “%@”, which increases the risk to this account if one of those accounts is compromised.");
      else
        v14 = CFSTR("You’re reusing this password on “%@”, “%@”, and “%@”, which increases the risk to this account if one of those accounts is compromised.");
      _WBSLocalizedString(v14, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v15, v16, v19, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v22);

      goto LABEL_20;
    default:
      v7 = objc_msgSend(v23, "count");
      v8 = (void *)MEMORY[0x1E0CB3940];
      if (v7)
        v9 = CFSTR("You’re also reusing this password on other websites, including “%@”, “%@”, and %lu more. This increases the risk to this account if one of those accounts is compromised.");
      else
        v9 = CFSTR("You’re reusing this password on other websites, including “%@”, “%@”, and %lu more. This increases the risk to this account if one of those accounts is compromised.");
      _WBSLocalizedString(v9, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v15, v16, v19, -[NSArray count](self->_titlesOfSavedAccountsWithReusedPassword, "count") - 2);
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v21 = (void *)v20;
      objc_msgSend(v23, "addObject:", v20);
LABEL_20:

LABEL_21:
      return;
  }
}

- (void)_addFormerlySharedWarningStringToWarningStrings:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFString *v22;
  id v23;

  v23 = a3;
  v4 = self->_issueTypes & 0x30;
  switch(v4)
  {
    case 0x30uLL:
      -[WBSSavedAccount formerlySharedPasswordMarker](self->_savedAccount, "formerlySharedPasswordMarker");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "nameOfGroupCredentialWasLastSharedIn");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v6 = v12;
      }
      else
      {
        -[WBSSavedAccount formerlySharedPasskeyMarker](self->_savedAccount, "formerlySharedPasskeyMarker");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "nameOfGroupCredentialWasLastSharedIn");
        v6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v18 = objc_msgSend(v23, "count");
      v19 = objc_msgSend(v6, "length");
      if (v18)
      {
        if (v19)
        {
          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = CFSTR("You also previously shared this passkey and this password with the group “%@”. You should change them if you want to ensure that members of that group no longer have access to this account.");
          goto LABEL_22;
        }
        v22 = CFSTR("You also previously shared this passkey and this password with a group. You should change them if you want to ensure that members of that group no longer have access to this account.");
      }
      else
      {
        if (v19)
        {
          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = CFSTR("You previously shared this passkey and this password with the group “%@”. You should change them if you want to ensure that members of that group no longer have access to this account.");
          goto LABEL_22;
        }
        v22 = CFSTR("You previously shared this passkey and this password with a group. You should change them if you want to ensure that members of that group no longer have access to this account.");
      }
      goto LABEL_29;
    case 0x20uLL:
      -[WBSSavedAccount formerlySharedPasskeyMarker](self->_savedAccount, "formerlySharedPasskeyMarker");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "nameOfGroupCredentialWasLastSharedIn");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v23, "count");
      v16 = objc_msgSend(v6, "length");
      if (v15)
      {
        if (v16)
        {
          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = CFSTR("You also previously shared this passkey with the group “%@”. You should change this passkey if you want to ensure that members of that group no longer have access to this account.");
          goto LABEL_22;
        }
        v22 = CFSTR("You also previously shared this passkey with a group. You should change this passkey if you want to ensure that members of that group no longer have access to this account.");
      }
      else
      {
        if (v16)
        {
          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = CFSTR("You previously shared this passkey with the group “%@”. You should change this passkey if you want to ensure that members of that group no longer have access to this account.");
          goto LABEL_22;
        }
        v22 = CFSTR("You previously shared this passkey with a group. You should change this passkey if you want to ensure that members of that group no longer have access to this account.");
      }
LABEL_29:
      _WBSLocalizedString(v22, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v20);
      goto LABEL_30;
    case 0x10uLL:
      -[WBSSavedAccount formerlySharedPasswordMarker](self->_savedAccount, "formerlySharedPasswordMarker");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nameOfGroupCredentialWasLastSharedIn");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v23, "count");
      v8 = objc_msgSend(v6, "length");
      if (v7)
      {
        if (v8)
        {
          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = CFSTR("You also previously shared this password with the group “%@”. You should change this password if you want to ensure that members of that group no longer have access to this account.");
LABEL_22:
          _WBSLocalizedString(v10, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "localizedStringWithFormat:", v20, v6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v21);

LABEL_30:
          break;
        }
        v22 = CFSTR("You also previously shared this password with a group. You should change this password if you want to ensure that members of that group no longer have access to this account.");
      }
      else
      {
        if (v8)
        {
          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = CFSTR("You previously shared this password with the group “%@”. You should change this password if you want to ensure that members of that group no longer have access to this account.");
          goto LABEL_22;
        }
        v22 = CFSTR("You previously shared this password with a group. You should change this password if you want to ensure that members of that group no longer have access to this account.");
      }
      goto LABEL_29;
  }

}

- (NSString)localizedHeadline
{
  __CFString *v3;
  unint64_t issueTypes;
  __CFString *v5;

  if (-[WBSPasswordWarning hasBeenCompromised](self, "hasBeenCompromised"))
  {
    v3 = CFSTR("This password should be changed immediately.");
LABEL_8:
    _WBSLocalizedString(v3, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v5;
  }
  issueTypes = self->_issueTypes;
  if ((issueTypes & 3) != 0 || (issueTypes & 0x10) != 0)
  {
    v3 = CFSTR("This password should be changed.");
    goto LABEL_8;
  }
  if ((issueTypes & 0x20) != 0)
  {
    v3 = CFSTR("This passkey should be changed.");
    goto LABEL_8;
  }
  v5 = &stru_1E64A2498;
  return (NSString *)v5;
}

- (NSString)localizedBody
{
  void *v3;
  __CFString *v4;
  unint64_t issueTypes;
  char v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (-[WBSPasswordWarning hasBeenCompromised](self, "hasBeenCompromised"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = CFSTR("Your “%@” password was detected in a data leak and may be compromised. Passwords can create and save a new one to help keep your account safe.");
  }
  else
  {
    issueTypes = self->_issueTypes;
    if ((issueTypes & 2) != 0)
    {
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = CFSTR("Your “%@” password is easy to guess. Passwords can create and save a new one to help keep your account safe.");
    }
    else
    {
      if ((issueTypes & 1) != 0)
      {
        v9 = &stru_1E64A2498;
        switch(-[NSArray count](self->_titlesOfSavedAccountsWithReusedPassword, "count"))
        {
          case 0uLL:
            return (NSString *)v9;
          case 1uLL:
            v11 = (void *)MEMORY[0x1E0CB3940];
            _WBSLocalizedString(CFSTR("Youʼre already using the password for “%@” with “%@”. Passwords can create and save a new one to help keep your account safe."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSSavedAccount effectiveTitle](self->_savedAccount, "effectiveTitle");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "localizedStringWithFormat:", v7, v8, v12);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_10;
          case 2uLL:
            v16 = (void *)MEMORY[0x1E0CB3940];
            _WBSLocalizedString(CFSTR("Youʼre already using the password for “%@” with “%@” and “%@”. Passwords can create and save a new one to help keep your account safe."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSSavedAccount effectiveTitle](self->_savedAccount, "effectiveTitle");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "localizedStringWithFormat:", v7, v8, v14, v17);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_20;
          case 3uLL:
            v18 = (void *)MEMORY[0x1E0CB3940];
            _WBSLocalizedString(CFSTR("Youʼre already using the password for “%@” with “%@”, “%@”, and “%@”. Passwords can create and save a new one to help keep your account safe."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSSavedAccount effectiveTitle](self->_savedAccount, "effectiveTitle");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 2);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "localizedStringWithFormat:", v7, v8, v14, v15, v19);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_19;
          default:
            v13 = (void *)MEMORY[0x1E0CB3940];
            _WBSLocalizedString(CFSTR("Youʼre already using the password for “%@” with “%@”, “%@”, and %lu more. Passwords can create and save a new one to help keep your account safe."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSSavedAccount effectiveTitle](self->_savedAccount, "effectiveTitle");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "localizedStringWithFormat:", v7, v8, v14, v15, -[NSArray count](self->_titlesOfSavedAccountsWithReusedPassword, "count") - 2);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
            break;
        }
        goto LABEL_10;
      }
      if ((issueTypes & 0x30) == 0)
      {
        v9 = &stru_1E64A2498;
        return (NSString *)v9;
      }
      v6 = -[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes");
      v3 = (void *)MEMORY[0x1E0CB3940];
      if ((v6 & 1) != 0)
        v4 = CFSTR("Your “%@” password was previously shared with other people. Passwords can create and save a new one to help keep your account safe.");
      else
        v4 = CFSTR("Your “%@” passkey was previously shared with other people. Passwords can create and save a new one to help keep your account safe.");
    }
  }
  _WBSLocalizedString(v4, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount effectiveTitle](self->_savedAccount, "effectiveTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v7, v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return (NSString *)v9;
}

- (id)localizedLongDescriptionForClient:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (a3 == 1)
  {
    -[WBSPasswordWarning _localizedLongWarningStringsForClient:](self, "_localizedLongWarningStringsForClient:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n\n"));
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5 = (void *)v4;

    return v5;
  }
  if (self->_issueTypes != 1)
  {
    -[WBSPasswordWarning _localizedLongWarningStringsForClient:](self, "_localizedLongWarningStringsForClient:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  _WBSLocalizedString(CFSTR("You’re reusing this password on other websites, which increases the risk to this account if one of those other accounts is compromised."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (NSString)localizedInformationTextForWarningWhenLoggingIn
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  -[WBSSavedAccount highLevelDomain](self->_savedAccount, "highLevelDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSDevice currentDevice](WBSDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceClass");

  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v4 == 3)
    v6 = CFSTR("iPad can create a strong password for you. Would you like to change your password for “%@”?");
  else
    v6 = CFSTR("iPhone can create a strong password for you. Would you like to change your password for “%@”?");
  _WBSLocalizedString(v6, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)localizedAlertWarningForSharingReusedPassword
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = &stru_1E64A2498;
  switch(-[NSArray count](self->_titlesOfSavedAccountsWithReusedPassword, "count"))
  {
    case 0uLL:
      return (NSString *)v3;
    case 1uLL:
      v4 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString(CFSTR("You’re also using this password on “%@”. Sharing this password might allow other members of this group to sign into accounts you don’t intend to share."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", v5, v6);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      v9 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString(CFSTR("You’re also using this password on “%@” and “%@”. Sharing this password might allow other members of this group to sign into accounts you don’t intend to share."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v5, v6, v10);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    case 3uLL:
      v11 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString(CFSTR("You’re also using this password on “%@”, “%@”, and “%@”. Sharing this password might allow other members of this group to sign into accounts you don’t intend to share."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v5, v6, v8, v12);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    default:
      v7 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString(CFSTR("You’re also using this password on other websites, including “%@”, “%@”, and %lu more. Sharing this password might allow other members of this group to sign into accounts you don’t intend to share."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titlesOfSavedAccountsWithReusedPassword, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v5, v6, v8, -[NSArray count](self->_titlesOfSavedAccountsWithReusedPassword, "count") - 2);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_7:
      return (NSString *)v3;
  }
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_severityScore);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
    v7 = -[WBSSavedAccount compare:](self->_savedAccount, "compare:", v4[4]);

  return v7;
}

- (unint64_t)hashForUserAcknowlegement
{
  void *v3;
  unint64_t v4;

  -[WBSSavedAccount highLevelDomain](self->_savedAccount, "highLevelDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_issueTypes ^ objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)hasBeenCompromised
{
  return (self->_issueTypes & 0xC) != 0;
}

- (BOOL)hasBeenHidden
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;

  -[WBSSavedAccount hideWarningMarker](self->_savedAccount, "hideWarningMarker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  if (!self->_issueTypes || (v5 = objc_msgSend(v3, "issueTypes"), (self->_issueTypes | v5) != v5))
  {
    +[WBSSavedAccountStore sharedStore](WBSSavedAccountStore, "sharedStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeHideWarningMarkerForSavedAccount:", self->_savedAccount);

LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  v6 = 1;
LABEL_7:

  return v6;
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (unint64_t)issueTypes
{
  return self->_issueTypes;
}

- (BOOL)savedAccountIsOnlySavedAccountForHighLevelDomain
{
  return self->_savedAccountIsOnlySavedAccountForHighLevelDomain;
}

- (unint64_t)severityScore
{
  return self->_severityScore;
}

- (void)setSeverityScore:(unint64_t)a3
{
  self->_severityScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAccount, 0);
  objc_storeStrong((id *)&self->_titlesOfSavedAccountsWithReusedPassword, 0);
  objc_storeStrong((id *)&self->_weakPasswordEvaluation, 0);
}

@end
