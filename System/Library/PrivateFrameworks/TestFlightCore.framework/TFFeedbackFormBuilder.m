@implementation TFFeedbackFormBuilder

- (id)buildFormForContext:(unint64_t)a3 withDeveloperName:(id)a4 prefilledEmail:(id)a5 hasScreenshots:(BOOL)a6
{
  _BOOL8 v6;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  TFFeedbackForm *v16;
  void *v17;
  TFFeedbackForm *v18;

  v6 = a6;
  v10 = (objc_class *)MEMORY[0x24BDBCEB8];
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithCapacity:", 2);
  -[TFFeedbackFormBuilder _buildEmailGroupWithDeveloperName:prefilledEmail:](self, "_buildEmailGroupWithDeveloperName:prefilledEmail:", v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObject:", v14);
  -[TFFeedbackFormBuilder _buildUserFeedbackGroupWithContext:hasScreenshots:](self, "_buildUserFeedbackGroupWithContext:hasScreenshots:", a3, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v15);
  v16 = [TFFeedbackForm alloc];
  TFLocalizedString(CFSTR("FEEDBACK_NAVIGATION_TITLE"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[TFFeedbackForm initWithTitle:entryGroups:](v16, "initWithTitle:entryGroups:", v17, v13);

  return v18;
}

- (id)_buildEmailGroupWithDeveloperName:(id)a3 prefilledEmail:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  TFFeedbackEntryShortText *v13;
  void *v14;
  void *v15;
  TFFeedbackEntryShortText *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  TFFeedbackEntryGroup *v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
  TFLocalizedString(CFSTR("FEEDBACK_FORM_ENTRY_EMAIL_FOOTER_LEARN_MORE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (v5)
    {
      v12 = objc_msgSend(v5, "length") != 0;
      goto LABEL_12;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v9 = objc_msgSend(v6, "length");
  v10 = v9;
  if (!v5)
  {
    if (v9)
      goto LABEL_9;
    goto LABEL_11;
  }
  v11 = objc_msgSend(v5, "length");
  v12 = v11 != 0;
  if (!v10)
  {
LABEL_12:
    v16 = [TFFeedbackEntryShortText alloc];
    TFLocalizedString(CFSTR("FEEDBACK_FORM_ENTRY_UNKNOWN_EMAIL_PLACEHOLDER"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[TFFeedbackEntryShortText initWithIdentifier:title:placeholder:contentType:](v16, "initWithIdentifier:title:placeholder:contentType:", CFSTR("a"), 0, v17, 1);

    objc_msgSend(v7, "addObject:", v13);
    TFLocalizedString(CFSTR("FEEDBACK_FORM_ENTRY_UNKNOWN_EMAIL_HEADER"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      TFLocalizedString(CFSTR("FEEDBACK_FORM_ENTRY_DEVELOPER_FOOTER"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v18, v5, v8);
    }
    else
    {
      TFLocalizedString(CFSTR("FEEDBACK_FORM_ENTRY_FOOTER"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v18, v8, v26);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  if (!v11)
  {
LABEL_9:
    TFLocalizedString(CFSTR("FEEDBACK_FORM_ENTRY_EMAIL_FOOTER"));
    v13 = (TFFeedbackEntryShortText *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v13, v6, v8, v27);
    goto LABEL_10;
  }
  TFLocalizedString(CFSTR("FEEDBACK_FORM_ENTRY_DEVELOPER_EMAIL_FOOTER"));
  v13 = (TFFeedbackEntryShortText *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v13, v5, v6, v8);
LABEL_10:
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
LABEL_16:

  if (v14 && (v19 = objc_msgSend(v14, "rangeOfString:options:", v8, 4), v19 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v22;
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://testflight.apple.com/feedback-learn-more"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }
  v24 = -[TFFeedbackEntryGroup initWithIdentifier:entries:title:election:headerText:headerTextLinkMap:footerText:footerTextLinkMap:]([TFFeedbackEntryGroup alloc], "initWithIdentifier:entries:title:election:headerText:headerTextLinkMap:footerText:footerTextLinkMap:", CFSTR("email-section"), v7, 0, 0, v15, 0, v14, v21);

  return v24;
}

- (id)_buildUserFeedbackGroupWithContext:(unint64_t)a3 hasScreenshots:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  TFFeedbackEntryLongText *v9;
  TFFeedbackEntryImageCollection *v10;
  TFFeedbackEntryGroup *v11;

  v4 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
  -[TFFeedbackFormBuilder _feedbackCommentPlaceholderStringForContext:](self, "_feedbackCommentPlaceholderStringForContext:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TFFeedbackEntryLongText initWithIdentifier:title:placeholder:]([TFFeedbackEntryLongText alloc], "initWithIdentifier:title:placeholder:", CFSTR("b"), 0, v8);
  objc_msgSend(v7, "addObject:", v9);
  if (v4)
  {
    v10 = -[TFFeedbackEntryImageCollection initWithIdentifier:title:]([TFFeedbackEntryImageCollection alloc], "initWithIdentifier:title:", CFSTR("c"), 0);
    objc_msgSend(v7, "addObject:", v10);

  }
  v11 = -[TFFeedbackEntryGroup initWithIdentifier:entries:title:election:headerText:headerTextLinkMap:footerText:footerTextLinkMap:]([TFFeedbackEntryGroup alloc], "initWithIdentifier:entries:title:election:headerText:headerTextLinkMap:footerText:footerTextLinkMap:", CFSTR("feedback-section"), v7, 0, 0, 0, 0, 0, 0);

  return v11;
}

- (id)_feedbackCommentPlaceholderStringForContext:(unint64_t)a3
{
  __CFString *v3;

  if (a3 == 2)
    v3 = CFSTR("FEEDBACK_FORM_ENTRY_COMMENTS_CRASH_PLACEHOLDER");
  else
    v3 = CFSTR("FEEDBACK_FORM_ENTRY_COMMENTS_DEFAULT_PLACEHOLDER");
  TFLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
