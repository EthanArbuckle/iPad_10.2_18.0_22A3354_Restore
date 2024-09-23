@implementation WFHandleInteractionDialogRequest

- (WFHandleInteractionDialogRequest)initWithInteraction:(id)a3 prompt:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WFHandleInteractionDialogRequest *v10;
  uint64_t v11;
  INInteraction *interaction;
  uint64_t v13;
  WFDialogButton *doneButton;
  WFHandleInteractionDialogRequest *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_intents_bundleIdForDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WFDialogRequest initWithAppBundleIdentifier:prompt:](self, "initWithAppBundleIdentifier:prompt:", v9, v7);
  if (v10)
  {
    v11 = objc_msgSend(v6, "copy");
    interaction = v10->_interaction;
    v10->_interaction = (INInteraction *)v11;

    +[WFDialogButton doneButton](WFDialogButton, "doneButton");
    v13 = objc_claimAutoreleasedReturnValue();
    doneButton = v10->_doneButton;
    v10->_doneButton = (WFDialogButton *)v13;

    v15 = v10;
  }

  return v10;
}

- (WFHandleInteractionDialogRequest)initWithInteraction:(id)a3 attribution:(id)a4
{
  id v6;
  WFHandleInteractionDialogRequest *v7;
  uint64_t v8;
  INInteraction *interaction;
  uint64_t v10;
  WFDialogButton *doneButton;
  WFHandleInteractionDialogRequest *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFHandleInteractionDialogRequest;
  v7 = -[WFDialogRequest initWithAttribution:prompt:](&v14, sel_initWithAttribution_prompt_, a4, 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    interaction = v7->_interaction;
    v7->_interaction = (INInteraction *)v8;

    +[WFDialogButton doneButton](WFDialogButton, "doneButton");
    v10 = objc_claimAutoreleasedReturnValue();
    doneButton = v7->_doneButton;
    v7->_doneButton = (WFDialogButton *)v10;

    v12 = v7;
  }

  return v7;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogRequest attribution](self, "attribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleInteractionDialogRequest interaction](self, "interaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleInteractionDialogRequest doneButton](self, "doneButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, title: %@, interaction: %@, doneButton: %@>"), v5, self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (WFHandleInteractionDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFHandleInteractionDialogRequest *v5;
  uint64_t v6;
  INInteraction *interaction;
  uint64_t v8;
  WFDialogButton *doneButton;
  WFHandleInteractionDialogRequest *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFHandleInteractionDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interaction"));
    v6 = objc_claimAutoreleasedReturnValue();
    interaction = v5->_interaction;
    v5->_interaction = (INInteraction *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doneButton"));
    v8 = objc_claimAutoreleasedReturnValue();
    doneButton = v5->_doneButton;
    v5->_doneButton = (WFDialogButton *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFHandleInteractionDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFHandleInteractionDialogRequest interaction](self, "interaction", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("interaction"));

  -[WFHandleInteractionDialogRequest doneButton](self, "doneButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("doneButton"));

}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (WFDialogButton)doneButton
{
  return self->_doneButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
