@implementation UIViewController(WFDrawerController)

- (void)wf_setDrawerController:()WFDrawerController
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__UIViewController_WFDrawerController__wf_setDrawerController___block_invoke;
  v7[3] = &unk_24EE25448;
  objc_copyWeak(&v8, &location);
  v5 = _Block_copy(v7);
  v6 = _Block_copy(v5);
  objc_setAssociatedObject(a1, sel_wf_drawerController, v6, (void *)0x303);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (id)wf_drawerController
{
  uint64_t v1;
  void *v2;
  void *v3;

  objc_getAssociatedObject(a1, sel_wf_drawerController);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)wf_setDrawerItem:()WFDrawerController
{
  objc_setAssociatedObject(a1, sel_wf_drawerItem, a3, (void *)1);
}

- (id)wf_drawerItem
{
  return objc_getAssociatedObject(a1, sel_wf_drawerItem);
}

@end
