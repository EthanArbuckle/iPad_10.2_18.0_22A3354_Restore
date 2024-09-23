@implementation SearchUIShowPurchaseRequestSheetHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  void *v5;
  id v6;

  v5 = (void *)MEMORY[0x1E0CFE208];
  objc_msgSend(a3, "requestIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentApprovalSheetWithRequestIdentifier:completion:", v6, 0);

}

- (unint64_t)destination
{
  return 8;
}

@end
