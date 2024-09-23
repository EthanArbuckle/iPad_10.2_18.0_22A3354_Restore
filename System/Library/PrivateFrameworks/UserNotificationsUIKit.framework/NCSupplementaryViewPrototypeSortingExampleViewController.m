@implementation NCSupplementaryViewPrototypeSortingExampleViewController

void __95___NCSupplementaryViewPrototypeSortingExampleViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatedDateModified");

}

@end
