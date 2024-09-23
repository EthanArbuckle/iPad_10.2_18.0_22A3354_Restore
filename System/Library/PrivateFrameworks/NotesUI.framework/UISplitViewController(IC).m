@implementation UISplitViewController(IC)

- (void)ic_showColumn:()IC animated:
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__UISplitViewController_IC__ic_showColumn_animated___block_invoke;
  v7[3] = &unk_1E5C1E560;
  v7[4] = a1;
  v7[5] = a3;
  v5 = _Block_copy(v7);
  v6 = v5;
  if (a4)
    (*((void (**)(void *))v5 + 2))(v5);
  else
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);

}

- (uint64_t)ic_toggleSidebar
{
  if (objc_msgSend(a1, "displayMode") == 1 || objc_msgSend(a1, "isCollapsed"))
    return objc_msgSend(a1, "showColumn:", 0);
  else
    return objc_msgSend(a1, "hideColumn:", 0);
}

@end
