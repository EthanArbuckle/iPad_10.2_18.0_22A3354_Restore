@implementation SAUIAddViews(SiriUIFoundationAdditions)

- (uint64_t)sruif_usefulUserResultType
{
  void *v1;
  int v2;

  objc_msgSend(a1, "af_dialogPhase");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isReflectionDialogPhase");

  return v2 ^ 1u;
}

@end
