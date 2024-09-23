@implementation SKUIITunesPassConfiguration

- (SKUIITunesPassConfiguration)initWithITunesPassDictionary:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  SKUIITunesPassConfiguration *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *dialogNotNowButton;
  void *v15;
  uint64_t v16;
  NSString *dialogMessage;
  void *v18;
  uint64_t v19;
  NSString *dialogTitle;
  void *v21;
  uint64_t v22;
  NSString *dialogLearnMoreButton;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *learnMoreAddPassButtonTitle;
  void *v28;
  uint64_t v29;
  NSString *learnMoreDoneButtonTitle;
  void *v31;
  uint64_t v32;
  NSString *learnMoreExplanation;
  void *v34;
  uint64_t v35;
  NSString *learnMoreTitle;
  void *v37;
  uint64_t v38;
  NSString *learnMoreViewPassButtonTitle;
  void *v40;
  void *v41;
  uint64_t v42;
  NSString *lockupDescription;
  void *v44;
  uint64_t v45;
  NSString *lockupLearnMoreLinkTitle;
  void *v47;
  uint64_t v48;
  NSString *lockupTitle;
  id v50;
  __CFString *v51;
  uint64_t v52;
  NSString *v53;
  id v54;
  __CFString *v55;
  uint64_t v56;
  NSString *v57;
  id v58;
  __CFString *v59;
  uint64_t v60;
  NSString *v61;
  id v62;
  __CFString *v63;
  uint64_t v64;
  NSString *v65;
  id v66;
  __CFString *v67;
  uint64_t v68;
  NSString *v69;
  id v70;
  __CFString *v71;
  uint64_t v72;
  NSString *v73;
  id v74;
  __CFString *v75;
  uint64_t v76;
  NSString *v77;
  id v78;
  __CFString *v79;
  uint64_t v80;
  NSString *v81;
  id v82;
  __CFString *v83;
  uint64_t v84;
  NSString *v85;
  id v86;
  __CFString *v87;
  uint64_t v88;
  NSString *v89;
  id v90;
  __CFString *v91;
  uint64_t v92;
  NSString *v93;
  id v94;
  __CFString *v95;
  uint64_t v96;
  NSString *v97;
  SKUIITunesPassConfiguration *v98;
  objc_super v100;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[SKUIITunesPassConfiguration initWithITunesPassDictionary:clientContext:].cold.1();

  }
  v100.receiver = self;
  v100.super_class = (Class)SKUIITunesPassConfiguration;
  v10 = -[SKUIITunesPassConfiguration init](&v100, sel_init);

  if (v10)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("learnMoreAlert"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("cancelButton"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "copy");
        dialogNotNowButton = v10->_dialogNotNowButton;
        v10->_dialogNotNowButton = (NSString *)v13;

      }
      objc_msgSend(v11, "objectForKey:", CFSTR("explanation"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = objc_msgSend(v15, "copy");
        dialogMessage = v10->_dialogMessage;
        v10->_dialogMessage = (NSString *)v16;

      }
      objc_msgSend(v11, "objectForKey:", CFSTR("message"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = objc_msgSend(v18, "copy");
        dialogTitle = v10->_dialogTitle;
        v10->_dialogTitle = (NSString *)v19;

      }
      objc_msgSend(v11, "objectForKey:", CFSTR("okButton"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = objc_msgSend(v21, "copy");
        dialogLearnMoreButton = v10->_dialogLearnMoreButton;
        v10->_dialogLearnMoreButton = (NSString *)v22;

      }
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("learnMore"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v24, "objectForKey:", CFSTR("addPassButton"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = objc_msgSend(v25, "copy");
        learnMoreAddPassButtonTitle = v10->_learnMoreAddPassButtonTitle;
        v10->_learnMoreAddPassButtonTitle = (NSString *)v26;

      }
      objc_msgSend(v24, "objectForKey:", CFSTR("doneButton"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = objc_msgSend(v28, "copy");
        learnMoreDoneButtonTitle = v10->_learnMoreDoneButtonTitle;
        v10->_learnMoreDoneButtonTitle = (NSString *)v29;

      }
      objc_msgSend(v24, "objectForKey:", CFSTR("explanation"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = objc_msgSend(v31, "copy");
        learnMoreExplanation = v10->_learnMoreExplanation;
        v10->_learnMoreExplanation = (NSString *)v32;

      }
      objc_msgSend(v24, "objectForKey:", CFSTR("title"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = objc_msgSend(v34, "copy");
        learnMoreTitle = v10->_learnMoreTitle;
        v10->_learnMoreTitle = (NSString *)v35;

      }
      objc_msgSend(v24, "objectForKey:", CFSTR("viewPassButton"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = objc_msgSend(v37, "copy");
        learnMoreViewPassButtonTitle = v10->_learnMoreViewPassButtonTitle;
        v10->_learnMoreViewPassButtonTitle = (NSString *)v38;

      }
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("lockup"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v40, "objectForKey:", CFSTR("description"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = objc_msgSend(v41, "copy");
        lockupDescription = v10->_lockupDescription;
        v10->_lockupDescription = (NSString *)v42;

      }
      objc_msgSend(v40, "objectForKey:", CFSTR("learnMore"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = objc_msgSend(v44, "copy");
        lockupLearnMoreLinkTitle = v10->_lockupLearnMoreLinkTitle;
        v10->_lockupLearnMoreLinkTitle = (NSString *)v45;

      }
      objc_msgSend(v40, "objectForKey:", CFSTR("title"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = objc_msgSend(v47, "copy");
        lockupTitle = v10->_lockupTitle;
        v10->_lockupTitle = (NSString *)v48;

      }
    }
    if (!v10->_dialogLearnMoreButton)
    {
      v50 = v7;
      v51 = CFSTR("Redeem");
      if (v50)
        objc_msgSend(v50, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_DIALOG_BUTTON_LEARN_MORE"), v51);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_DIALOG_BUTTON_LEARN_MORE"), 0, v51);
      v52 = objc_claimAutoreleasedReturnValue();

      v53 = v10->_dialogLearnMoreButton;
      v10->_dialogLearnMoreButton = (NSString *)v52;

    }
    if (!v10->_dialogMessage)
    {
      v54 = v7;
      v55 = CFSTR("Redeem");
      if (v54)
        objc_msgSend(v54, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_DIALOG_MESSAGE"), v55);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_DIALOG_MESSAGE"), 0, v55);
      v56 = objc_claimAutoreleasedReturnValue();

      v57 = v10->_dialogMessage;
      v10->_dialogMessage = (NSString *)v56;

    }
    if (!v10->_dialogNotNowButton)
    {
      v58 = v7;
      v59 = CFSTR("Redeem");
      if (v58)
        objc_msgSend(v58, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_DIALOG_BUTTON_NOT_NOW"), v59);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_DIALOG_BUTTON_NOT_NOW"), 0, v59);
      v60 = objc_claimAutoreleasedReturnValue();

      v61 = v10->_dialogNotNowButton;
      v10->_dialogNotNowButton = (NSString *)v60;

    }
    if (!v10->_dialogTitle)
    {
      v62 = v7;
      v63 = CFSTR("Redeem");
      if (v62)
        objc_msgSend(v62, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_DIALOG_TITLE"), v63);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_DIALOG_TITLE"), 0, v63);
      v64 = objc_claimAutoreleasedReturnValue();

      v65 = v10->_dialogTitle;
      v10->_dialogTitle = (NSString *)v64;

    }
    if (!v10->_learnMoreAddPassButtonTitle)
    {
      v66 = v7;
      v67 = CFSTR("Redeem");
      if (v66)
        objc_msgSend(v66, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_ADD_PASS_BUTTON"), v67);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_ADD_PASS_BUTTON"), 0, v67);
      v68 = objc_claimAutoreleasedReturnValue();

      v69 = v10->_learnMoreAddPassButtonTitle;
      v10->_learnMoreAddPassButtonTitle = (NSString *)v68;

    }
    if (!v10->_learnMoreDoneButtonTitle)
    {
      v70 = v7;
      v71 = CFSTR("Redeem");
      if (v70)
        objc_msgSend(v70, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_DONE_BUTTON"), v71);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_DONE_BUTTON"), 0, v71);
      v72 = objc_claimAutoreleasedReturnValue();

      v73 = v10->_learnMoreDoneButtonTitle;
      v10->_learnMoreDoneButtonTitle = (NSString *)v72;

    }
    if (!v10->_learnMoreExplanation)
    {
      v74 = v7;
      v75 = CFSTR("Redeem");
      if (v74)
        objc_msgSend(v74, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_EXPLANATION"), v75);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_EXPLANATION"), 0, v75);
      v76 = objc_claimAutoreleasedReturnValue();

      v77 = v10->_learnMoreExplanation;
      v10->_learnMoreExplanation = (NSString *)v76;

    }
    if (!v10->_learnMoreTitle)
    {
      v78 = v7;
      v79 = CFSTR("Redeem");
      if (v78)
        objc_msgSend(v78, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_TITLE"), v79);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_TITLE"), 0, v79);
      v80 = objc_claimAutoreleasedReturnValue();

      v81 = v10->_learnMoreTitle;
      v10->_learnMoreTitle = (NSString *)v80;

    }
    if (!v10->_learnMoreViewPassButtonTitle)
    {
      v82 = v7;
      v83 = CFSTR("Redeem");
      if (v82)
        objc_msgSend(v82, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_VIEW_PASS_BUTTON"), v83);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_VIEW_PASS_BUTTON"), 0, v83);
      v84 = objc_claimAutoreleasedReturnValue();

      v85 = v10->_learnMoreViewPassButtonTitle;
      v10->_learnMoreViewPassButtonTitle = (NSString *)v84;

    }
    if (!v10->_lockupDescription)
    {
      v86 = v7;
      v87 = CFSTR("Redeem");
      if (v86)
        objc_msgSend(v86, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_EXPLANATION"), v87);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_EXPLANATION"), 0, v87);
      v88 = objc_claimAutoreleasedReturnValue();

      v89 = v10->_lockupDescription;
      v10->_lockupDescription = (NSString *)v88;

    }
    if (!v10->_lockupLearnMoreLinkTitle)
    {
      v90 = v7;
      v91 = CFSTR("Redeem");
      if (v90)
        objc_msgSend(v90, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_LINK"), v91);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_LINK"), 0, v91);
      v92 = objc_claimAutoreleasedReturnValue();

      v93 = v10->_lockupLearnMoreLinkTitle;
      v10->_lockupLearnMoreLinkTitle = (NSString *)v92;

    }
    if (!v10->_lockupTitle)
    {
      v94 = v7;
      v95 = CFSTR("Redeem");
      if (v94)
        objc_msgSend(v94, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_TITLE"), v95);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_TITLE"), 0, v95);
      v96 = objc_claimAutoreleasedReturnValue();

      v97 = v10->_lockupTitle;
      v10->_lockupTitle = (NSString *)v96;

    }
  }
  v98 = v10;

  return v98;
}

- (id)learnMoreAlertView
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3458]), "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", self->_dialogTitle, self->_dialogMessage, 0, self->_dialogNotNowButton, self->_dialogLearnMoreButton, 0);
}

- (NSString)learnMoreAddPassButtonTitle
{
  return self->_learnMoreAddPassButtonTitle;
}

- (NSString)learnMoreDoneButtonTitle
{
  return self->_learnMoreDoneButtonTitle;
}

- (NSString)learnMoreExplanation
{
  return self->_learnMoreExplanation;
}

- (NSString)learnMoreTitle
{
  return self->_learnMoreTitle;
}

- (NSString)learnMoreViewPassButtonTitle
{
  return self->_learnMoreViewPassButtonTitle;
}

- (NSString)lockupDescription
{
  return self->_lockupDescription;
}

- (NSString)lockupLearnMoreLinkTitle
{
  return self->_lockupLearnMoreLinkTitle;
}

- (NSString)lockupTitle
{
  return self->_lockupTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupTitle, 0);
  objc_storeStrong((id *)&self->_lockupLearnMoreLinkTitle, 0);
  objc_storeStrong((id *)&self->_lockupDescription, 0);
  objc_storeStrong((id *)&self->_learnMoreViewPassButtonTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreExplanation, 0);
  objc_storeStrong((id *)&self->_learnMoreDoneButtonTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreAddPassButtonTitle, 0);
  objc_storeStrong((id *)&self->_dialogTitle, 0);
  objc_storeStrong((id *)&self->_dialogNotNowButton, 0);
  objc_storeStrong((id *)&self->_dialogMessage, 0);
  objc_storeStrong((id *)&self->_dialogLearnMoreButton, 0);
}

- (void)initWithITunesPassDictionary:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIITunesPassConfiguration initWithITunesPassDictionary:clientContext:]";
}

@end
