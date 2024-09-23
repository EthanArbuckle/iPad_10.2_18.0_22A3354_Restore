@implementation UIViewController(TTRIContentUnavailableShim)

- (id)ttr_unavailableSearchResultsText
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_contentUnavailableConfigurationState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "searchControllerText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
