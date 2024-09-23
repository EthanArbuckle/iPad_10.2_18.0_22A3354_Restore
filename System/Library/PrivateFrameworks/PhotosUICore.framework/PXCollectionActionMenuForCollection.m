@implementation PXCollectionActionMenuForCollection

void __PXCollectionActionMenuForCollection_block_invoke(void **a1, uint64_t a2)
{
  id v3;

  PXCollectionRenameAlertControllerForCollection(a1[4], a2, a1[5], 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "presentViewController:animated:completionHandler:", v3, 1, 0);

}

void __PXCollectionActionMenuForCollection_block_invoke_2(void **a1)
{
  id v2;

  PXCollectionDeletionAlertControllerForCollection(a1[4], 0, a1[5], 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "presentViewController:animated:completionHandler:", v2, 1, 0);

}

@end
