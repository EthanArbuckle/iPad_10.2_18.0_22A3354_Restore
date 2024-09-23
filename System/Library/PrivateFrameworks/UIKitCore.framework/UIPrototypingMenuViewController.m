@implementation UIPrototypingMenuViewController

void __51___UIPrototypingMenuViewController__resetSettings___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[_UIPrototypingSettingsManager sharedManager](_UIPrototypingSettingsManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteAllStoredSettings");

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 968);
  *(_QWORD *)(v3 + 968) = 0;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

uint64_t __51___UIPrototypingMenuViewController__resetSettings___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
