@implementation SiriUIBaseSnippetViewController

- (SiriUISashItem)sashItem
{
  SiriUISashItem *sashItem;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  SiriUISashItem *v18;
  SiriUISashItem *v19;
  SiriUISashItem *v20;
  SiriUISashItem *v21;
  SiriUISashItem *v22;
  SiriUISashItem *v23;
  SiriUISashItem *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  SiriUISashItem *v34;
  void *v35;
  SiriUISashItem *v36;
  void *v37;
  SiriUISashItem *v38;
  void *v39;
  SiriUISashItem *v40;
  void *v41;
  SiriUISashItem *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;

  sashItem = self->_sashItem;
  if (sashItem)
  {
LABEL_29:
    v23 = sashItem;
    return v23;
  }
  -[SiriUIBaseSnippetViewController snippet](self, "snippet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "applicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v10 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
    {
      +[SiriUIUtilities defaultBrowserBundleIdentifier](SiriUIUtilities, "defaultBrowserBundleIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v11;
    }
    v47 = (void *)v10;
    if (v6)
    {
      v46 = v9;
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ApplePayCash")))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("ApplePay"), v12);
        v13 = v8;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v15 = v7;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "scale");
        objc_msgSend(v14, "_applicationIconImageForFormat:precomposed:scale:", 5, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v15;
        v8 = v13;
        v18 = -[SiriSharedUISashItem initWithTitle:image:]([SiriUISashItem alloc], "initWithTitle:image:", v15, v17);
        v19 = self->_sashItem;
        self->_sashItem = v18;

        v10 = (uint64_t)v47;
      }
      else
      {
        v21 = -[SiriSharedUISashItem initWithApplicationBundleIdentifier:]([SiriUISashItem alloc], "initWithApplicationBundleIdentifier:", v6);
        v12 = v21;
        if (v21)
        {
          v22 = v21;
        }
        else
        {
          +[SiriUISashItem defaultSashItem](SiriUISashItem, "defaultSashItem");
          v22 = (SiriUISashItem *)objc_claimAutoreleasedReturnValue();
        }
        v24 = self->_sashItem;
        self->_sashItem = v22;

      }
LABEL_16:

      if (v7)
        -[SiriUISashItem setTitle:](self->_sashItem, "setTitle:", v7);
      if (!v10)
        goto LABEL_24;
      objc_msgSend(v47, "resourceUrl");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isFileURL");

      if (v26)
      {
        v44 = v7;
        v45 = v8;
        v43 = self->_sashItem;
        v27 = (void *)MEMORY[0x24BDF6AC8];
        objc_msgSend(v47, "resourceUrl");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "path");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "imageNamed:inBundle:compatibleWithTraitCollection:", v30, v31, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriUISashItem setImage:](v43, "setImage:", v32);

        v7 = v44;
      }
      else
      {
        objc_msgSend(v47, "imageData");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
LABEL_24:
          if (v8)
          {
            v36 = self->_sashItem;
            objc_msgSend(MEMORY[0x24BDF6950], "siriui_colorWithAceColor:", v8);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[SiriSharedUISashItem setBackgroundColor:](v36, "setBackgroundColor:", v37);

          }
          if (v46)
          {
            v38 = self->_sashItem;
            objc_msgSend(MEMORY[0x24BDF6950], "siriui_colorWithAceColor:", v46);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[SiriSharedUISashItem setTextColor:](v38, "setTextColor:", v39);

          }
          -[SiriSharedUISashItem setRequestsExtraPadding:](self->_sashItem, "setRequestsExtraPadding:", 1);
          v40 = self->_sashItem;
          objc_msgSend(v5, "commands");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[SiriSharedUISashItem setCommands:](v40, "setCommands:", v41);

          sashItem = self->_sashItem;
          goto LABEL_29;
        }
        v45 = v8;
        v34 = self->_sashItem;
        v35 = (void *)MEMORY[0x24BDF6AC8];
        objc_msgSend(v47, "imageData");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "imageWithData:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriUISashItem setImage:](v34, "setImage:", v29);
      }

      v8 = v45;
      goto LABEL_24;
    }
    if (v7 | v10)
    {
      v46 = v9;
      v20 = objc_alloc_init(SiriUISashItem);
      v12 = self->_sashItem;
      self->_sashItem = v20;
      goto LABEL_16;
    }

  }
  v23 = 0;
  return v23;
}

- (BOOL)hasSash
{
  void *v2;
  BOOL v3;

  -[SiriUIBaseSnippetViewController sashItem](self, "sashItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isInAmbient
{
  return 0;
}

- (double)desiredHeight
{
  return 0.0;
}

- (AceObject)aceObject
{
  return self->aceObject;
}

- (void)setAceObject:(id)a3
{
  objc_storeStrong((id *)&self->aceObject, a3);
}

- (BOOL)isUtteranceUserInteractionEnabled
{
  return self->_utteranceUserInteractionEnabled;
}

- (void)setUtteranceUserInteractionEnabled:(BOOL)a3
{
  self->_utteranceUserInteractionEnabled = a3;
}

- (SiriUIBaseAceObjectViewControllerDelegate)delegate
{
  return (SiriUIBaseAceObjectViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)instrumentationTurnIdentifier
{
  return self->_instrumentationTurnIdentifier;
}

- (void)setInstrumentationTurnIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentationTurnIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationTurnIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sashItem, 0);
  objc_storeStrong((id *)&self->aceObject, 0);
}

@end
