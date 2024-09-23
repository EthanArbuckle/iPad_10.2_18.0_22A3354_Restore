@implementation WFWorkflowWizardNameConfiguration

- (WFWorkflowWizardNameConfiguration)init
{
  WFWorkflowWizardNameConfiguration *v2;
  WFWorkflowWizardNameConfiguration *v3;
  uint64_t v4;
  NSString *doneBarButtonTitle;
  WFWorkflowWizardNameConfiguration *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFWorkflowWizardNameConfiguration;
  v2 = -[WFWorkflowWizardNameConfiguration init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_showsHeySiri = 257;
    WFLocalizedString(CFSTR("Done"));
    v4 = objc_claimAutoreleasedReturnValue();
    doneBarButtonTitle = v3->_doneBarButtonTitle;
    v3->_doneBarButtonTitle = (NSString *)v4;

    v6 = v3;
  }

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)showsHeySiri
{
  return self->_showsHeySiri;
}

- (void)setShowsHeySiri:(BOOL)a3
{
  self->_showsHeySiri = a3;
}

- (BOOL)showsSuggestions
{
  return self->_showsSuggestions;
}

- (void)setShowsSuggestions:(BOOL)a3
{
  self->_showsSuggestions = a3;
}

- (NSString)doneBarButtonTitle
{
  return self->_doneBarButtonTitle;
}

- (void)setDoneBarButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneBarButtonTitle, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)newWorkflowConfiguration
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)objc_opt_class());
  WFLocalizedString(CFSTR("New Shortcut"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  objc_msgSend(a1, "tellSiriInfoText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFooterText:", v5);

  return v3;
}

+ (id)addToSiriConfiguration
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)objc_opt_class());
  WFLocalizedString(CFSTR("Add to Siri"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  objc_msgSend(a1, "tellSiriInfoText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFooterText:", v5);

  return v3;
}

+ (id)tellSiriInfoText
{
  return WFLocalizedString(CFSTR("Use this name to tell Siri to run this shortcut."));
}

@end
