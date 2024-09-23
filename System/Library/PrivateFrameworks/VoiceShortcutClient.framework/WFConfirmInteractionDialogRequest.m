@implementation WFConfirmInteractionDialogRequest

- (WFConfirmInteractionDialogRequest)initWithInteraction:(id)a3 prompt:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  WFConfirmInteractionDialogRequest *v11;
  uint64_t v12;
  INInteraction *interaction;
  void *v14;
  void *v15;
  uint64_t v16;
  WFDialogButton *confirmButton;
  uint64_t v18;
  WFDialogButton *cancelButton;
  WFConfirmInteractionDialogRequest *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_intents_bundleIdForDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFDialogAttribution attributionWithAppBundleIdentifier:](WFDialogAttribution, "attributionWithAppBundleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)WFConfirmInteractionDialogRequest;
  v11 = -[WFDialogRequest initWithAttribution:prompt:](&v22, sel_initWithAttribution_prompt_, v10, v7);

  if (v11)
  {
    v12 = objc_msgSend(v6, "copy");
    interaction = v11->_interaction;
    v11->_interaction = (INInteraction *)v12;

    objc_msgSend(v6, "intent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_categoryVerb");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFDialogButton defaultButtonWithTitle:](WFDialogButton, "defaultButtonWithTitle:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    confirmButton = v11->_confirmButton;
    v11->_confirmButton = (WFDialogButton *)v16;

    +[WFDialogButton cancelButton](WFDialogButton, "cancelButton");
    v18 = objc_claimAutoreleasedReturnValue();
    cancelButton = v11->_cancelButton;
    v11->_cancelButton = (WFDialogButton *)v18;

    v20 = v11;
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogRequest attribution](self, "attribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfirmInteractionDialogRequest interaction](self, "interaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfirmInteractionDialogRequest confirmButton](self, "confirmButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfirmInteractionDialogRequest cancelButton](self, "cancelButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, title: %@, interaction: %@, confirmButton: %@, cancelButton: %@>"), v5, self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (WFConfirmInteractionDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFConfirmInteractionDialogRequest *v5;
  uint64_t v6;
  INInteraction *interaction;
  uint64_t v8;
  WFDialogButton *confirmButton;
  uint64_t v10;
  WFDialogButton *cancelButton;
  WFConfirmInteractionDialogRequest *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFConfirmInteractionDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interaction"));
    v6 = objc_claimAutoreleasedReturnValue();
    interaction = v5->_interaction;
    v5->_interaction = (INInteraction *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmButton"));
    v8 = objc_claimAutoreleasedReturnValue();
    confirmButton = v5->_confirmButton;
    v5->_confirmButton = (WFDialogButton *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancelButton"));
    v10 = objc_claimAutoreleasedReturnValue();
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (WFDialogButton *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFConfirmInteractionDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[WFConfirmInteractionDialogRequest interaction](self, "interaction", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("interaction"));

  -[WFConfirmInteractionDialogRequest confirmButton](self, "confirmButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("confirmButton"));

  -[WFConfirmInteractionDialogRequest cancelButton](self, "cancelButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cancelButton"));

}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (WFDialogButton)confirmButton
{
  return self->_confirmButton;
}

- (WFDialogButton)cancelButton
{
  return self->_cancelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
