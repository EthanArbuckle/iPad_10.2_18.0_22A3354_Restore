@implementation SUDocumentation

- (SUDocumentation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUDocumentation;
  return -[SUDocumentation init](&v3, sel_init);
}

- (SUDocumentation)initWithSUCoreDocumentation:(id)a3
{
  id v4;
  SUDocumentation *v5;
  SUDocumentation *v6;

  v4 = a3;
  v5 = -[SUDocumentation init](self, "init");
  v6 = v5;
  if (v5)
    -[SUDocumentation setCoreDocumentation:](v5, "setCoreDocumentation:", v4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUDocumentation)initWithCoder:(id)a3
{
  id v4;
  SUDocumentation *v5;
  void *v6;

  v4 = a3;
  v5 = -[SUDocumentation init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coreDocumentation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDocumentation setCoreDocumentation:](v5, "setCoreDocumentation:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  SUDocumentation *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v5, "encodeObject:forKey:", v4->_coreDocumentation, CFSTR("coreDocumentation"));
  objc_sync_exit(v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  SUDocumentation *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "setCoreDocumentation:", v5->_coreDocumentation);
  objc_sync_exit(v5);

  return v4;
}

- (id)slaVersion
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDocumentation slaVersion](v2->_coreDocumentation, "slaVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)iconImage
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDocumentation softwareUpdateIconImage](v2->_coreDocumentation, "softwareUpdateIconImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)humanReadableUpdateName
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUDocumentation _resetIfNecessary](v2, "_resetIfNecessary");
  -[SUCoreDocumentation humanReadableUpdateName](v2->_coreDocumentation, "humanReadableUpdateName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)notificationTitleString
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUDocumentation _resetIfNecessary](v2, "_resetIfNecessary");
  if (-[SUCoreDocumentation notificationEnabled](v2->_coreDocumentation, "notificationEnabled"))
  {
    -[SUCoreDocumentation notificationTitleString](v2->_coreDocumentation, "notificationTitleString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)notificationBodyString
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUDocumentation _resetIfNecessary](v2, "_resetIfNecessary");
  if (-[SUCoreDocumentation notificationEnabled](v2->_coreDocumentation, "notificationEnabled"))
  {
    -[SUCoreDocumentation notificationBodyString](v2->_coreDocumentation, "notificationBodyString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)recommendedUpdateTitleString
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUDocumentation _resetIfNecessary](v2, "_resetIfNecessary");
  -[SUCoreDocumentation recommendedUpdateTitleString](v2->_coreDocumentation, "recommendedUpdateTitleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)recommendedUpdateAlertBodyString
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUDocumentation _resetIfNecessary](v2, "_resetIfNecessary");
  -[SUCoreDocumentation recommendedUpdateAlertBodyString](v2->_coreDocumentation, "recommendedUpdateAlertBodyString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)mandatoryUpdateBodyString
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUDocumentation _resetIfNecessary](v2, "_resetIfNecessary");
  -[SUCoreDocumentation mandatoryUpdateBodyString](v2->_coreDocumentation, "mandatoryUpdateBodyString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)releaseNotesSummaryFileName
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDocumentation releaseNotesSummaryFileName](v2->_coreDocumentation, "releaseNotesSummaryFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)releaseNotesSummary
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUDocumentation _resetIfNecessary](v2, "_resetIfNecessary");
  -[SUCoreDocumentation releaseNotesSummary](v2->_coreDocumentation, "releaseNotesSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)releaseNotesFileName
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDocumentation releaseNotesFileName](v2->_coreDocumentation, "releaseNotesFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)releaseNotes
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUDocumentation _resetIfNecessary](v2, "_resetIfNecessary");
  -[SUCoreDocumentation releaseNotes](v2->_coreDocumentation, "releaseNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)licenseAgreementFileName
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUCoreDocumentation licenseAgreementFileName](v2->_coreDocumentation, "licenseAgreementFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)licenseAgreement
{
  SUDocumentation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUDocumentation _resetIfNecessary](v2, "_resetIfNecessary");
  -[SUCoreDocumentation licenseAgreement](v2->_coreDocumentation, "licenseAgreement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)hasAnyDocumentation
{
  SUDocumentation *v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  -[SUDocumentation _resetIfNecessary](v2, "_resetIfNecessary");
  -[SUCoreDocumentation releaseNotesSummary](v2->_coreDocumentation, "releaseNotesSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[SUCoreDocumentation releaseNotes](v2->_coreDocumentation, "releaseNotes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[SUCoreDocumentation licenseAgreement](v2->_coreDocumentation, "licenseAgreement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  objc_sync_exit(v2);
  return v4;
}

- (id)description
{
  SUDocumentation *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v2 = self;
  objc_sync_enter(v2);
  -[SUDocumentation _resetIfNecessary](v2, "_resetIfNecessary");
  v20 = (void *)MEMORY[0x24BDD17C8];
  -[SUCoreDocumentation releaseNotesSummary](v2->_coreDocumentation, "releaseNotesSummary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    v3 = CFSTR("Yes");
  else
    v3 = CFSTR("No");
  v19 = v3;
  -[SUCoreDocumentation releaseNotes](v2->_coreDocumentation, "releaseNotes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    v4 = CFSTR("Yes");
  else
    v4 = CFSTR("No");
  v18 = v4;
  -[SUCoreDocumentation licenseAgreement](v2->_coreDocumentation, "licenseAgreement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  v17 = v5;
  -[SUCoreDocumentation preferencesIconFileName](v2->_coreDocumentation, "preferencesIconFileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentation softwareUpdateIconImage](v2->_coreDocumentation, "softwareUpdateIconImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  -[SUCoreDocumentation humanReadableUpdateName](v2->_coreDocumentation, "humanReadableUpdateName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDocumentation notificationTitleString](v2, "notificationTitleString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDocumentation notificationBodyString](v2, "notificationBodyString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDocumentation recommendedUpdateTitleString](v2, "recommendedUpdateTitleString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDocumentation recommendedUpdateAlertBodyString](v2, "recommendedUpdateAlertBodyString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDocumentation mandatoryUpdateBodyString](v2, "mandatoryUpdateBodyString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("\n                \thasReadMeSummary: %@\n                \thasReadMe: %@\n                \thasLicenseAgreement: %@\n                \thasIconImageName: %@\n                \thasIconImage: %@\n                \thumanReadableUpdateName: %@\n                \tnotificationTitle:%@\n                \tnotificationBody:%@\n                \trecommendedUpdateTitle:%@\n                \trecommendedUpdateBody:%@\n                \tmandatoryUpdateBody:%@"), v19, v18, v17, v6, v8, v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v15;
}

- (void)_resetIfNecessary
{
  void *v3;
  void *v4;
  __CFString *v5;
  id v6;
  __CFString *v7;

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("en");
  }
  v7 = v5;
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", self->_primaryLanguage) & 1) == 0)
  {
    -[SUDocumentation setPrimaryLanguage:](self, "setPrimaryLanguage:", v7);
    v6 = (id)-[SUCoreDocumentation extendDocumentationProperties](self->_coreDocumentation, "extendDocumentationProperties");
  }

}

- (SUCoreDocumentation)coreDocumentation
{
  return self->_coreDocumentation;
}

- (void)setCoreDocumentation:(id)a3
{
  objc_storeStrong((id *)&self->_coreDocumentation, a3);
}

- (NSString)primaryLanguage
{
  return self->_primaryLanguage;
}

- (void)setPrimaryLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLanguage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryLanguage, 0);
  objc_storeStrong((id *)&self->_coreDocumentation, 0);
}

@end
