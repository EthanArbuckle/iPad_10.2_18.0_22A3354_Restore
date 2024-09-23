@implementation WFSmartPromptDialogRequest

- (WFSmartPromptDialogRequest)initWithConfiguration:(id)a3 attribution:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFSmartPromptDialogRequest *v10;
  uint64_t v11;
  NSString *secondaryText;
  uint64_t v13;
  NSData *archivedSourceContentCollection;
  void *v15;
  uint64_t v16;
  WFContentCollection *cachedSourceContentCollection;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  WFDialogButton *previewButton;
  NSObject *v25;
  WFSmartPromptDialogRequest *v26;
  void *v27;
  int v28;
  __CFString *v29;
  __CFString *v30;
  id v31;
  void *v32;
  uint64_t v33;
  WFDialogButton *v34;
  id v35;
  void *v36;
  uint64_t v37;
  WFDialogButton *v38;
  void *allowOnceButton;
  id v40;
  uint64_t v41;
  WFDialogButton *v42;
  char v43;
  id v44;
  __CFString *v45;
  void *v46;
  uint64_t v47;
  WFDialogButton *allowAlwaysButton;
  id v49;
  void *v50;
  const __CFString *v51;
  uint64_t v52;
  WFDialogButton *denyButton;
  objc_super v55;
  uint8_t buf[4];
  const char *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "localizedPrompt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55.receiver = self;
  v55.super_class = (Class)WFSmartPromptDialogRequest;
  v10 = -[WFDialogRequest initWithAttribution:prompt:](&v55, sel_initWithAttribution_prompt_, v8, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_configuration, a3);
    objc_msgSend(v7, "localizedSubtitle");
    v11 = objc_claimAutoreleasedReturnValue();
    secondaryText = v10->_secondaryText;
    v10->_secondaryText = (NSString *)v11;

    objc_msgSend(v7, "archivedSourceContentCollection");
    v13 = objc_claimAutoreleasedReturnValue();
    archivedSourceContentCollection = v10->_archivedSourceContentCollection;
    v10->_archivedSourceContentCollection = (NSData *)v13;

    if (v10->_archivedSourceContentCollection)
    {
      objc_msgSend(v7, "cachedSourceContentCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      cachedSourceContentCollection = v10->_cachedSourceContentCollection;
      v10->_cachedSourceContentCollection = (WFContentCollection *)v16;

      v18 = -[WFContentCollection numberOfItems](v10->_cachedSourceContentCollection, "numberOfItems");
      v19 = v18;
      if (v18 > 1
        || v18 == 1
        && (objc_msgSend(v7, "requestSource"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("Siri")),
            v27,
            v28))
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("Show All %d"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringWithFormat:", v21, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AD8]), "initWithIdentifier:title:style:", CFSTR("Handoff"), v22, 0);
        previewButton = v10->_previewButton;
        v10->_previewButton = (WFDialogButton *)v23;

      }
      else
      {
        v22 = v10->_previewButton;
        v10->_previewButton = 0;
      }

      objc_msgSend(v7, "requestType");
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v29 == CFSTR("SmartPrompt"))
      {
        if ((objc_msgSend(v7, "isSpecialRequest") & 1) != 0)
        {
          allowOnceButton = v10->_allowOnceButton;
          v10->_allowOnceButton = 0;
        }
        else
        {
          v40 = objc_alloc(MEMORY[0x1E0DC7AD8]);
          WFLocalizedString(CFSTR("Allow Once"));
          allowOnceButton = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "initWithIdentifier:title:style:", CFSTR("AllowOnce"), allowOnceButton, 0);
          v42 = v10->_allowOnceButton;
          v10->_allowOnceButton = (WFDialogButton *)v41;

        }
        v43 = objc_msgSend(v7, "isSpecialRequest");
        v44 = objc_alloc(MEMORY[0x1E0DC7AD8]);
        if ((v43 & 1) != 0)
          v45 = CFSTR("Allow");
        else
          v45 = CFSTR("Always Allow");
        WFLocalizedString(v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v44, "initWithIdentifier:title:style:", CFSTR("AllowAlways"), v46, 0);
        allowAlwaysButton = v10->_allowAlwaysButton;
        v10->_allowAlwaysButton = (WFDialogButton *)v47;

        v49 = objc_alloc(MEMORY[0x1E0DC7AD8]);
        WFLocalizedString(CFSTR("Don’t Allow"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = CFSTR("Deny");
      }
      else
      {
        objc_msgSend(v7, "requestType");
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v30 != CFSTR("DeletionAuthorization"))
        {
LABEL_26:
          v26 = v10;
          goto LABEL_27;
        }
        v31 = objc_alloc(MEMORY[0x1E0DC7AD8]);
        WFLocalizedString(CFSTR("Delete"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "initWithIdentifier:title:style:", CFSTR("AllowOnce"), v32, 2);
        v34 = v10->_allowOnceButton;
        v10->_allowOnceButton = (WFDialogButton *)v33;

        if (+[WFShortcutsSecuritySettings allowsDeletingWithoutConfirmation](WFShortcutsSecuritySettings, "allowsDeletingWithoutConfirmation"))
        {
          v35 = objc_alloc(MEMORY[0x1E0DC7AD8]);
          WFLocalizedString(CFSTR("Delete Always"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v35, "initWithIdentifier:title:style:", CFSTR("AllowAlways"), v36, 2);
          v38 = v10->_allowAlwaysButton;
          v10->_allowAlwaysButton = (WFDialogButton *)v37;

        }
        else
        {
          v36 = v10->_allowAlwaysButton;
          v10->_allowAlwaysButton = 0;
        }

        v49 = objc_alloc(MEMORY[0x1E0DC7AD8]);
        WFLocalizedString(CFSTR("Don’t Delete"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = CFSTR("DontDelete");
      }
      v52 = objc_msgSend(v49, "initWithIdentifier:title:style:", v51, v50, 1);
      denyButton = v10->_denyButton;
      v10->_denyButton = (WFDialogButton *)v52;

      goto LABEL_26;
    }
    getWFGeneralLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[WFSmartPromptDialogRequest initWithConfiguration:attribution:]";
      _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_FAULT, "%s Unable to archive smart prompt source content collection", buf, 0xCu);
    }

  }
  v26 = 0;
LABEL_27:

  return v26;
}

- (BOOL)shouldCenterPrompt
{
  return 1;
}

- (WFSmartPromptDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFSmartPromptDialogRequest *v5;
  uint64_t v6;
  WFSmartPromptConfiguration *configuration;
  uint64_t v8;
  NSString *secondaryText;
  uint64_t v10;
  NSData *archivedSourceContentCollection;
  uint64_t v12;
  WFDialogButton *previewButton;
  uint64_t v14;
  WFDialogButton *allowOnceButton;
  uint64_t v16;
  WFDialogButton *allowAlwaysButton;
  uint64_t v18;
  WFDialogButton *denyButton;
  WFSmartPromptDialogRequest *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WFSmartPromptDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (WFSmartPromptConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryText"));
    v8 = objc_claimAutoreleasedReturnValue();
    secondaryText = v5->_secondaryText;
    v5->_secondaryText = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archivedSourceContentCollection"));
    v10 = objc_claimAutoreleasedReturnValue();
    archivedSourceContentCollection = v5->_archivedSourceContentCollection;
    v5->_archivedSourceContentCollection = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previewButton"));
    v12 = objc_claimAutoreleasedReturnValue();
    previewButton = v5->_previewButton;
    v5->_previewButton = (WFDialogButton *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowOnceButton"));
    v14 = objc_claimAutoreleasedReturnValue();
    allowOnceButton = v5->_allowOnceButton;
    v5->_allowOnceButton = (WFDialogButton *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowAlwaysButton"));
    v16 = objc_claimAutoreleasedReturnValue();
    allowAlwaysButton = v5->_allowAlwaysButton;
    v5->_allowAlwaysButton = (WFDialogButton *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("denyButton"));
    v18 = objc_claimAutoreleasedReturnValue();
    denyButton = v5->_denyButton;
    v5->_denyButton = (WFDialogButton *)v18;

    v20 = v5;
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
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFSmartPromptDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  -[WFSmartPromptDialogRequest configuration](self, "configuration", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("configuration"));

  -[WFSmartPromptDialogRequest secondaryText](self, "secondaryText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("secondaryText"));

  -[WFSmartPromptDialogRequest archivedSourceContentCollection](self, "archivedSourceContentCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("archivedSourceContentCollection"));

  -[WFSmartPromptDialogRequest previewButton](self, "previewButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("previewButton"));

  -[WFSmartPromptDialogRequest allowOnceButton](self, "allowOnceButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("allowOnceButton"));

  -[WFSmartPromptDialogRequest allowAlwaysButton](self, "allowAlwaysButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("allowAlwaysButton"));

  -[WFSmartPromptDialogRequest denyButton](self, "denyButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("denyButton"));

}

- (void)getContentCollectionWithCompletionHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void (**v8)(void *, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[6];
  _QWORD aBlock[4];
  id v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSmartPromptDialogRequest.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__WFSmartPromptDialogRequest_getContentCollectionWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E7AF50F8;
  v7 = v5;
  v18 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[WFSmartPromptDialogRequest cachedSourceContentCollection](self, "cachedSourceContentCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFSmartPromptDialogRequest cachedSourceContentCollection](self, "cachedSourceContentCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v10);

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3710];
    -[WFSmartPromptDialogRequest archivedSourceContentCollection](self, "archivedSourceContentCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __72__WFSmartPromptDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_3;
    v16[3] = &unk_1E7AF5120;
    v16[4] = self;
    v16[5] = v8;
    v14 = (id)objc_msgSend(v11, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v12, v13, v16);

  }
}

- (WFSmartPromptConfiguration)configuration
{
  return self->_configuration;
}

- (WFDialogButton)previewButton
{
  return self->_previewButton;
}

- (WFDialogButton)allowOnceButton
{
  return self->_allowOnceButton;
}

- (WFDialogButton)allowAlwaysButton
{
  return self->_allowAlwaysButton;
}

- (WFDialogButton)denyButton
{
  return self->_denyButton;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (NSData)archivedSourceContentCollection
{
  return self->_archivedSourceContentCollection;
}

- (void)setArchivedSourceContentCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (WFContentCollection)cachedSourceContentCollection
{
  return self->_cachedSourceContentCollection;
}

- (void)setCachedSourceContentCollection:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSourceContentCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSourceContentCollection, 0);
  objc_storeStrong((id *)&self->_archivedSourceContentCollection, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_denyButton, 0);
  objc_storeStrong((id *)&self->_allowAlwaysButton, 0);
  objc_storeStrong((id *)&self->_allowOnceButton, 0);
  objc_storeStrong((id *)&self->_previewButton, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __72__WFSmartPromptDialogRequest_getContentCollectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *label;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  label = dispatch_queue_get_label(MEMORY[0x1E0C80D38]);
  if (label == dispatch_queue_get_label(0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__WFSmartPromptDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E7AF76F0;
    v8 = *(id *)(a1 + 32);
    v7 = v3;
    v5 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __72__WFSmartPromptDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    getWFGeneralLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = 136315138;
      v6 = "-[WFSmartPromptDialogRequest getContentCollectionWithCompletionHandler:]_block_invoke_3";
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_FAULT, "%s Unable to unarchive smart prompt content collection.", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setCachedSourceContentCollection:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __72__WFSmartPromptDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
