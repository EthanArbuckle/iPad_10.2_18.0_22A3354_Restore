@implementation WFDialogRequest

- (WFDialogRequest)initWithAppBundleIdentifier:(id)a3 prompt:(id)a4
{
  id v6;
  void *v7;
  WFDialogRequest *v8;

  v6 = a4;
  +[WFDialogAttribution attributionWithAppBundleIdentifier:](WFDialogAttribution, "attributionWithAppBundleIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFDialogRequest initWithAttribution:prompt:](self, "initWithAttribution:prompt:", v7, v6);

  return v8;
}

- (WFDialogRequest)initWithAttribution:(id)a3 prompt:(id)a4
{
  id v7;
  id v8;
  WFDialogRequest *v9;
  WFDialogRequest *v10;
  uint64_t v11;
  NSString *prompt;
  WFDialogRequest *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFDialogRequest;
  v9 = -[WFDialogRequest init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attribution, a3);
    v11 = objc_msgSend(v8, "copy");
    prompt = v10->_prompt;
    v10->_prompt = (NSString *)v11;

    v10->_requiresRunningShortcut = 1;
    v13 = v10;
  }

  return v10;
}

- (NSString)promptForDisplay
{
  void *v2;
  void *v3;
  void *v4;

  -[WFDialogRequest prompt](self, "prompt");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[WFTTSString parseAnnotatedString:](WFTTSString, "parseAnnotatedString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)shouldCenterPrompt
{
  return 0;
}

- (BOOL)hasMultilineTextEntry
{
  return 0;
}

- (WFDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFDialogRequest *v5;
  uint64_t v6;
  WFDialogAttribution *attribution;
  uint64_t v8;
  NSString *prompt;
  uint64_t v10;
  WFWorkflowRunViewSource *runViewSource;
  uint64_t v12;
  LNDialog *linkDialog;
  WFDialogRequest *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFDialogRequest;
  v5 = -[WFDialogRequest init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attribution"));
    v6 = objc_claimAutoreleasedReturnValue();
    attribution = v5->_attribution;
    v5->_attribution = (WFDialogAttribution *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prompt"));
    v8 = objc_claimAutoreleasedReturnValue();
    prompt = v5->_prompt;
    v5->_prompt = (NSString *)v8;

    v5->_requiresRunningShortcut = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresRunningShortcut"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("runViewSource"));
    v10 = objc_claimAutoreleasedReturnValue();
    runViewSource = v5->_runViewSource;
    v5->_runViewSource = (WFWorkflowRunViewSource *)v10;

    v5->_isLastAction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLastAction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkDialog"));
    v12 = objc_claimAutoreleasedReturnValue();
    linkDialog = v5->_linkDialog;
    v5->_linkDialog = (LNDialog *)v12;

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
  id v8;

  v4 = a3;
  -[WFDialogRequest attribution](self, "attribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("attribution"));

  -[WFDialogRequest prompt](self, "prompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("prompt"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogRequest requiresRunningShortcut](self, "requiresRunningShortcut"), CFSTR("requiresRunningShortcut"));
  -[WFDialogRequest runViewSource](self, "runViewSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("runViewSource"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogRequest isLastAction](self, "isLastAction"), CFSTR("isLastAction"));
  -[WFDialogRequest linkDialog](self, "linkDialog");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("linkDialog"));

}

- (WFDialogAttribution)attribution
{
  return self->_attribution;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunViewSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isLastAction
{
  return self->_isLastAction;
}

- (void)setIsLastAction:(BOOL)a3
{
  self->_isLastAction = a3;
}

- (BOOL)requiresRunningShortcut
{
  return self->_requiresRunningShortcut;
}

- (void)setRequiresRunningShortcut:(BOOL)a3
{
  self->_requiresRunningShortcut = a3;
}

- (LNDialog)linkDialog
{
  return self->_linkDialog;
}

- (void)setLinkDialog:(id)a3
{
  objc_storeStrong((id *)&self->_linkDialog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkDialog, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
