@implementation PKSetupAssistantUtilityContext

- (PKSetupAssistantUtilityContext)initWithSetupAssistant:(unint64_t)a3
{
  PKSetupAssistantUtilityContext *result;
  unint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSetupAssistantUtilityContext;
  result = -[PKSetupAssistantUtilityContext init](&v6, sel_init);
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

- (unint64_t)setupAssistant
{
  return self->_setupAssistant;
}

- (NSData)externalizedContext
{
  return self->externalizedContext;
}

- (void)setExternalizedContext:(id)a3
{
  objc_storeStrong((id *)&self->externalizedContext, a3);
}

- (BOOL)isFollowupAction
{
  return self->isFollowupAction;
}

- (BOOL)allowsCachedCardRequirements
{
  return self->_allowsCachedCardRequirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->externalizedContext, 0);
}

@end
