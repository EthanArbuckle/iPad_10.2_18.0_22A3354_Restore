@implementation WFLinkConfirmationDialogRequest

- (WFLinkConfirmationDialogRequest)initWithActionMetadata:(id)a3 showPrompt:(BOOL)a4 dialogString:(id)a5 viewSnippet:(id)a6 yesText:(id)a7 noText:(id)a8 attribution:(id)a9 parameterInfo:(id)a10 isContinueInAppRequest:(BOOL)a11
{
  _BOOL4 v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  WFLinkConfirmationDialogRequest *v25;
  uint64_t v27;

  v14 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  if (!v14)
  {
    v22 = 0;
    goto LABEL_5;
  }
  v22 = v16;
  if (v16)
  {
LABEL_5:
    v23 = v22;
    goto LABEL_6;
  }
  WFLocalizedString(CFSTR("Ready to do it?"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v24 = v23;
  LOBYTE(v27) = a11;
  v25 = -[WFLinkConfirmationDialogRequest initWithTitle:viewSnippet:yesText:noText:attribution:parameterInfo:isContinueInAppRequest:](self, "initWithTitle:viewSnippet:yesText:noText:attribution:parameterInfo:isContinueInAppRequest:", v23, v17, v18, v19, v20, v21, v27);

  return v25;
}

- (WFLinkConfirmationDialogRequest)initWithActionParameterMetadata:(id)a3 dialogString:(id)a4 viewSnippet:(id)a5 attribution:(id)a6 parameterInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  WFLinkConfirmationDialogRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (a4)
  {
    LOBYTE(v21) = 0;
    v16 = -[WFLinkConfirmationDialogRequest initWithTitle:viewSnippet:yesText:noText:attribution:parameterInfo:isContinueInAppRequest:](self, "initWithTitle:viewSnippet:yesText:noText:attribution:parameterInfo:isContinueInAppRequest:", a4, v13, 0, 0, v14, v15, v21);
  }
  else
  {
    objc_msgSend(v12, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringWithPluralizationNumber:forLocaleIdentifier:", &unk_1E6002880, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      LOBYTE(v21) = 0;
      v16 = -[WFLinkConfirmationDialogRequest initWithTitle:viewSnippet:yesText:noText:attribution:parameterInfo:isContinueInAppRequest:](self, "initWithTitle:viewSnippet:yesText:noText:attribution:parameterInfo:isContinueInAppRequest:", v18, v13, 0, 0, v14, v15, v21);
    }
    else
    {
      objc_msgSend(v12, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v21) = 0;
      v16 = -[WFLinkConfirmationDialogRequest initWithTitle:viewSnippet:yesText:noText:attribution:parameterInfo:isContinueInAppRequest:](self, "initWithTitle:viewSnippet:yesText:noText:attribution:parameterInfo:isContinueInAppRequest:", v19, v13, 0, 0, v14, v15, v21);

    }
  }

  return v16;
}

- (WFLinkConfirmationDialogRequest)initWithTitle:(id)a3 viewSnippet:(id)a4 yesText:(id)a5 noText:(id)a6 attribution:(id)a7 parameterInfo:(id)a8 isContinueInAppRequest:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  WFLinkConfirmationDialogRequest *v19;
  uint64_t v20;
  NSString *title;
  id v22;
  void *v23;
  id v24;
  void *v25;
  WFDialogButton *v26;
  WFDialogButton *yesButton;
  WFDialogButton *v28;
  WFDialogButton *noButton;
  WFLinkConfirmationDialogRequest *v30;
  objc_super v32;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v32.receiver = self;
  v32.super_class = (Class)WFLinkConfirmationDialogRequest;
  v19 = -[WFLinkSnippetDialogRequest initWithViewSnippet:attribution:](&v32, sel_initWithViewSnippet_attribution_, a4, a7);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    title = v19->_title;
    v19->_title = (NSString *)v20;

    if (v16)
    {
      v22 = v16;
    }
    else
    {
      WFLocalizedString(CFSTR("Yes"));
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v22;
    if (v17)
    {
      v24 = v17;
    }
    else
    {
      WFLocalizedString(CFSTR("No"));
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;
    v26 = -[WFDialogButton initWithTitle:style:]([WFDialogButton alloc], "initWithTitle:style:", v23, 0);
    yesButton = v19->_yesButton;
    v19->_yesButton = v26;

    v28 = -[WFDialogButton initWithTitle:style:]([WFDialogButton alloc], "initWithTitle:style:", v25, 1);
    noButton = v19->_noButton;
    v19->_noButton = v28;

    objc_storeStrong((id *)&v19->_parameterInfo, a8);
    v19->_isContinueInAppRequest = a9;
    v30 = v19;

  }
  return v19;
}

- (WFLinkConfirmationDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFLinkConfirmationDialogRequest *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  WFDialogButton *yesButton;
  uint64_t v10;
  WFDialogButton *noButton;
  uint64_t v12;
  WFParameterKeyValuePair *parameterInfo;
  WFLinkConfirmationDialogRequest *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFLinkConfirmationDialogRequest;
  v5 = -[WFLinkSnippetDialogRequest initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("yesButton"));
    v8 = objc_claimAutoreleasedReturnValue();
    yesButton = v5->_yesButton;
    v5->_yesButton = (WFDialogButton *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("noButton"));
    v10 = objc_claimAutoreleasedReturnValue();
    noButton = v5->_noButton;
    v5->_noButton = (WFDialogButton *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterInfo"));
    v12 = objc_claimAutoreleasedReturnValue();
    parameterInfo = v5->_parameterInfo;
    v5->_parameterInfo = (WFParameterKeyValuePair *)v12;

    v5->_isContinueInAppRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isContinueInAppRequest"));
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFLinkConfirmationDialogRequest;
  v4 = a3;
  -[WFLinkSnippetDialogRequest encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[WFLinkConfirmationDialogRequest title](self, "title", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[WFLinkConfirmationDialogRequest yesButton](self, "yesButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("yesButton"));

  -[WFLinkConfirmationDialogRequest noButton](self, "noButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("noButton"));

  -[WFLinkConfirmationDialogRequest parameterInfo](self, "parameterInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("parameterInfo"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFLinkConfirmationDialogRequest isContinueInAppRequest](self, "isContinueInAppRequest"), CFSTR("isContinueInAppRequest"));
}

- (NSString)title
{
  return self->_title;
}

- (WFDialogButton)yesButton
{
  return self->_yesButton;
}

- (WFDialogButton)noButton
{
  return self->_noButton;
}

- (WFParameterKeyValuePair)parameterInfo
{
  return self->_parameterInfo;
}

- (BOOL)isContinueInAppRequest
{
  return self->_isContinueInAppRequest;
}

- (void)setIsContinueInAppRequest:(BOOL)a3
{
  self->_isContinueInAppRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterInfo, 0);
  objc_storeStrong((id *)&self->_noButton, 0);
  objc_storeStrong((id *)&self->_yesButton, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
