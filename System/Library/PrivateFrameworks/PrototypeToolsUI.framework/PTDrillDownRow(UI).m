@implementation PTDrillDownRow(UI)

- (uint64_t)tableViewCellClass
{
  return objc_opt_class();
}

- (id)defaultUIAction
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __37__PTDrillDownRow_UI__defaultUIAction__block_invoke;
  v2[3] = &unk_24C435A98;
  v2[4] = a1;
  +[PTUIPushViewControllerRowAction actionWithViewControllerCreator:](PTUIPushViewControllerRowAction, "actionWithViewControllerCreator:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
