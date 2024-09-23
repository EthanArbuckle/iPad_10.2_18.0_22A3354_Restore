@implementation NSUserActivity(NSUserActivityCoreSpotlightInteraction)

- (void)_updateForwardToCoreSpotlightIndexer:()NSUserActivityCoreSpotlightInteraction
{
  void *v5;
  char v6;
  id v7;

  objc_msgSend(a1, "_internalUserActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(a1, "_internalUserActivity");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateForwardToCoreSpotlightIndexer:", a3);

  }
}

- (void)_sendToCoreSpotlightIndexer
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(a1, "_internalUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(a1, "_internalUserActivity");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendToCoreSpotlightIndexer");

  }
}

@end
