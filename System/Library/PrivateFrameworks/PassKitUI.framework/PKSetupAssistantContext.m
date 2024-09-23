@implementation PKSetupAssistantContext

- (PKSetupAssistantContext)init
{
  return -[PKSetupAssistantContext initWithSetupAssistant:](self, "initWithSetupAssistant:", 1);
}

- (PKSetupAssistantContext)initWithSetupAssistant:(unint64_t)a3
{
  PKSetupAssistantContext *result;
  unint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSetupAssistantContext;
  result = -[PKSetupAssistantContext init](&v6, sel_init);
  if (result)
  {
    if (a3 == 2)
      v5 = 2;
    else
      v5 = 1;
    result->_setupAssistant = v5;
    result->_allowsCachedCardRequirements = 1;
  }
  return result;
}

- (PKSetupAssistantContext)initWithSetupAssistantAsFollowupAction:(unint64_t)a3
{
  PKSetupAssistantContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSetupAssistantContext;
  result = -[PKSetupAssistantContext init](&v5, sel_init);
  if (result)
  {
    result->_setupAssistant = a3;
    result->_isFollowupAction = 1;
  }
  return result;
}

- (void)prepareForFollowupQueryWithHandler:(id)a3
{
  if (a3)
  {
    self->_allowsCachedCardRequirements = 0;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_allowsCachedCardRequirements = 1;
  }
}

- (BOOL)allowsCachedCardRequirements
{
  if (self->_allowsCachedCardRequirements)
    return PKRunningInPassd() ^ 1;
  else
    return 0;
}

- (NSString)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSetupAssistantContext extendableDescription:](self, "extendableDescription:", v3);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (void)extendableDescription:(id)a3
{
  unint64_t setupAssistant;
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  id WeakRetained;

  setupAssistant = self->_setupAssistant;
  v5 = a3;
  objc_msgSend(v5, "appendFormat:", CFSTR("setupAssistant: '%lu'; "), setupAssistant);
  if (self->_isFollowupAction)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("isFollowupAction: '%@'; "), v6);
  if (self->_allowsCachedCardRequirements)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("allowsCachedCardRequirements: %@; "), v7);
  if (self->_externalizedContext)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("hasExternalizedContext: '%@'; "), v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v5, "appendFormat:", CFSTR("delegate: '%@'; "), WeakRetained);

}

- (unint64_t)setupAssistant
{
  return self->_setupAssistant;
}

- (void)setSetupAssistant:(unint64_t)a3
{
  self->_setupAssistant = a3;
}

- (BOOL)isFollowupAction
{
  return self->_isFollowupAction;
}

- (void)setAllowsCachedCardRequirements:(BOOL)a3
{
  self->_allowsCachedCardRequirements = a3;
}

- (NSData)externalizedContext
{
  return self->_externalizedContext;
}

- (void)setExternalizedContext:(id)a3
{
  objc_storeStrong((id *)&self->_externalizedContext, a3);
}

- (PKPaymentSetupViewControllerDelegate)delegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_externalizedContext, 0);
}

@end
