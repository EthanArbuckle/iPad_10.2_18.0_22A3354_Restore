@implementation WFActionDonationSet

- (WFActionDonationSet)init
{
  WFActionDonationSet *v2;
  uint64_t v3;
  NSMutableArray *predictedActions;
  uint64_t v5;
  NSMutableArray *recentActions;
  uint64_t v7;
  NSMutableArray *appSuggestedActions;
  WFActionDonationSet *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFActionDonationSet;
  v2 = -[WFActionDonationSet init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    predictedActions = v2->_predictedActions;
    v2->_predictedActions = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    recentActions = v2->_recentActions;
    v2->_recentActions = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    appSuggestedActions = v2->_appSuggestedActions;
    v2->_appSuggestedActions = (NSMutableArray *)v7;

    v9 = v2;
  }

  return v2;
}

- (NSMutableArray)predictedActions
{
  return self->_predictedActions;
}

- (NSMutableArray)recentActions
{
  return self->_recentActions;
}

- (NSMutableArray)appSuggestedActions
{
  return self->_appSuggestedActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSuggestedActions, 0);
  objc_storeStrong((id *)&self->_recentActions, 0);
  objc_storeStrong((id *)&self->_predictedActions, 0);
}

@end
