@implementation TUIAutofillExtraCandidateCell

+ (id)reuseIdentifier
{
  return CFSTR("TUIAutofillExtraCandidateCell");
}

- (id)headerText
{
  return 0;
}

- (id)bodyText
{
  void *v2;
  void *v3;
  CGRect v5;

  -[TUIAutofillExtraCandidateCell bounds](self, "bounds");
  if (CGRectGetWidth(v5) <= 50.0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringInDeviceLanguageForKey:", CFSTR("Passwords"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)image
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  -[TUICandidateBaseCell style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateBaseCell style](self, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "autofillExtraCandidateImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TUICandidateBaseCell style](self, "style");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "autofillExtraCandidateImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {

  }
  -[TUICandidateBaseCell style](self, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v11;

  objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("kb-autofill-key"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_flatImageWithColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v7;
}

@end
