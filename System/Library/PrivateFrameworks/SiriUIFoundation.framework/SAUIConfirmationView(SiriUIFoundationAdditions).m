@implementation SAUIConfirmationView(SiriUIFoundationAdditions)

- (BOOL)sruif_hasButton
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "allConfirmationOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

@end
