@implementation OBPrivacyLinkController_iOS

- (OBPrivacyLinkController_iOS)initWithPrivacyBundle:(id)a3
{
  OBPrivacyLinkController_iOS *v3;
  void *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OBPrivacyLinkController_iOS;
  v3 = -[OBPrivacyLinkController initWithPrivacyBundle:](&v7, sel_initWithPrivacyBundle_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    -[OBPrivacyLinkController setDisplayLargeIcon:](v3, "setDisplayLargeIcon:", v5 > 568.01);

    -[OBPrivacyLinkController setDisplayCaptionText:](v3, "setDisplayCaptionText:", 1);
    -[OBPrivacyLinkController setDisplayDeviceType:](v3, "setDisplayDeviceType:", 0);
    -[OBPrivacyLinkController_iOS setModalPresentationStyle:](v3, "setModalPresentationStyle:", 2);
  }
  return v3;
}

- (OBPrivacyLinkController_iOS)initWithBundleIdentifiers:(id)a3
{
  OBPrivacyLinkController_iOS *v3;
  void *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OBPrivacyLinkController_iOS;
  v3 = -[OBPrivacyLinkController initWithBundleIdentifiers:](&v7, sel_initWithBundleIdentifiers_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    -[OBPrivacyLinkController setDisplayLargeIcon:](v3, "setDisplayLargeIcon:", v5 > 568.01);

    -[OBPrivacyLinkController setDisplayCaptionText:](v3, "setDisplayCaptionText:", 1);
    -[OBPrivacyLinkController setDisplayDeviceType:](v3, "setDisplayDeviceType:", 0);
    -[OBPrivacyLinkController_iOS setModalPresentationStyle:](v3, "setModalPresentationStyle:", 2);
  }
  return v3;
}

- (void)loadView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  OBPrivacyLinkButton *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL8 v22;
  void *v23;
  OBPrivacyLinkButton *v24;
  OBPrivacyLinkButton *linkButton;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  _BOOL4 bundlesIncludePII;
  const __CFString *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (-[OBPrivacyLinkController displayIcon](self, "displayIcon"))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[OBPrivacyLinkController bundles](self, "bundles", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "privacyFlow");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "buttonIcon");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            objc_msgSend(v7, "buttonIcon");
            v4 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }

        }
        v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v4 = 0;
  }
  -[OBPrivacyLinkController_iOS processBundlesForTitleInformation](self, "processBundlesForTitleInformation");
  -[OBPrivacyLinkController bundles](self, "bundles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") < 2 || self->bundleTitlesMatch)
  {

  }
  else
  {
    -[OBPrivacyLinkController bundle](self, "bundle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isLinkBundle");

    if ((v33 & 1) == 0)
    {
      bundlesIncludePII = self->bundlesIncludePII;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacyLinkController displayLanguage](self, "displayLanguage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (bundlesIncludePII)
        v35 = CFSTR("PRIVACY_LINK_MULTIPLE_PII");
      else
        v35 = CFSTR("PRIVACY_LINK_MULTIPLE");
      +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", v35, CFSTR("Localizable"), v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  -[OBPrivacyLinkController flow](self, "flow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyLinkController displayLanguage](self, "displayLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedButtonTitleForLanguage:preferredDeviceType:", v11, -[OBPrivacyLinkController displayDeviceType](self, "displayDeviceType"));
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_18:
  v13 = (void *)v12;

  if (-[OBPrivacyLinkController displayIcon](self, "displayIcon")
    && -[OBPrivacyLinkController displayCaptionText](self, "displayCaptionText"))
  {
    -[OBPrivacyLinkController flow](self, "flow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkController displayLanguage](self, "displayLanguage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedButtonCaptionForLanguage:preferredDeviceType:", v15, -[OBPrivacyLinkController displayDeviceType](self, "displayDeviceType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  v17 = [OBPrivacyLinkButton alloc];
  objc_msgSend(v4, "size");
  v19 = v18;
  v21 = v20;
  v22 = -[OBPrivacyLinkController displayLargeIcon](self, "displayLargeIcon");
  -[OBPrivacyLinkController displayLanguage](self, "displayLanguage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[OBPrivacyLinkButton initWithCaption:buttonText:image:imageSize:useLargeIcon:displayLanguage:](v17, "initWithCaption:buttonText:image:imageSize:useLargeIcon:displayLanguage:", v16, v13, v4, v22, v23, v19, v21);
  linkButton = self->_linkButton;
  self->_linkButton = v24;

  -[OBPrivacyLinkButton addTarget:action:forControlEvents:](self->_linkButton, "addTarget:action:forControlEvents:", self, sel__linkPressed, 0x2000);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyLinkController displayLanguage](self, "displayLanguage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("PRIVACY_ICON_DESCRIPTION"), CFSTR("Localizable"), v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyLinkButton iconView](self->_linkButton, "iconView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAccessibilityLabel:", v28);

  -[OBPrivacyLinkButton setUnderlineLinks:](self->_linkButton, "setUnderlineLinks:", -[OBPrivacyLinkController underlineLinks](self, "underlineLinks"));
  -[OBPrivacyLinkController customTintColor](self, "customTintColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[OBPrivacyLinkController customTintColor](self, "customTintColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton setTintColor:](self->_linkButton, "setTintColor:", v31);

  }
  -[OBPrivacyLinkController_iOS setView:](self, "setView:", self->_linkButton);

}

- (void)processBundlesForTitleInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  self->bundleTitlesMatch = 1;
  self->bundlesIncludePII = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[OBPrivacyLinkController bundles](self, "bundles", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "privacyFlow");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedButtonTitle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v6)
        {
          if (objc_msgSend(v10, "localizedStandardCompare:", v6))
            self->bundleTitlesMatch = 0;
          if (!self->bundlesIncludePII)
            self->bundlesIncludePII = objc_msgSend(v9, "isPersonallyIdentifiable");

        }
        else
        {
          if (!self->bundlesIncludePII)
            self->bundlesIncludePII = objc_msgSend(v9, "isPersonallyIdentifiable");
          v6 = v11;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

}

- (void)setLinkEnabled:(BOOL)a3
{
  -[OBPrivacyLinkButton setEnabled:](self->_linkButton, "setEnabled:", a3);
}

- (UIImageView)iconView
{
  return -[OBPrivacyLinkButton iconView](self->_linkButton, "iconView");
}

- (UITextView)textView
{
  return -[OBPrivacyLinkButton textView](self->_linkButton, "textView");
}

- (void)setCustomTintColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBPrivacyLinkController_iOS;
  v4 = a3;
  -[OBPrivacyLinkController setCustomTintColor:](&v5, sel_setCustomTintColor_, v4);
  -[OBPrivacyLinkButton setTintColor:](self->_linkButton, "setTintColor:", v4, v5.receiver, v5.super_class);

}

- (void)setUnderlineLinks:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)OBPrivacyLinkController_iOS;
  -[OBPrivacyLinkController setUnderlineLinks:](&v5, sel_setUnderlineLinks_);
  -[OBPrivacyLinkButton setUnderlineLinks:](self->_linkButton, "setUnderlineLinks:", v3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkButton, 0);
}

@end
