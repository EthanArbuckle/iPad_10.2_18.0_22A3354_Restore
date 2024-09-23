@implementation UINotificationFeedbackGeneratorConfiguration

void __69___UINotificationFeedbackGeneratorConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  uint64_t v4;
  id v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "includePrivateEvents");
  if (qword_1ECD7A578 != -1)
    dispatch_once(&qword_1ECD7A578, &__block_literal_global_78_0);
  v4 = 24;
  if (v3)
    v4 = 32;
  _UICreateNotificationFeedbacksForTypes(*(void **)&_MergedGlobals_3_8[v4]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFeedbacks:", v5);

}

void __78___UINotificationFeedbackGeneratorConfiguration_privateConfigurationForTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  _UICreateNotificationFeedbacksForTypes(v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFeedbacks:", v4);

}

@end
