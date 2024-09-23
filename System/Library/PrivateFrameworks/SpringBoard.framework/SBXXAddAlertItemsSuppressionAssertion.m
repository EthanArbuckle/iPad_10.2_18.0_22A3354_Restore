@implementation SBXXAddAlertItemsSuppressionAssertion

void ___SBXXAddAlertItemsSuppressionAssertion_block_invoke(uint64_t a1)
{
  id v2;

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureSuppressionAssertion:reason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
