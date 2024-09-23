@implementation CACContextCluesPresentationManager

- (void)showWithCommands:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CACContextCluesPresentationManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__CACContextCluesPresentationManager_showWithCommands___block_invoke;
  v6[3] = &unk_24F2AD3D8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CACSimpleContentViewManager showViewControllerWithCreationHandler:updateHandler:](self, "showViewControllerWithCreationHandler:updateHandler:", v6, &__block_literal_global_42);

}

CACContextCluesViewController *__55__CACContextCluesPresentationManager_showWithCommands___block_invoke(uint64_t a1)
{
  CACContextCluesViewController *v2;

  v2 = -[CACContextCluesViewController initWithCommands:]([CACContextCluesViewController alloc], "initWithCommands:", *(_QWORD *)(a1 + 32));
  -[CACContextCluesViewController setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 40));
  return v2;
}

- (void)contextCludesDidPressDoneButton
{
  -[CACSimpleContentViewManager hideAnimated:completion:](self, "hideAnimated:completion:", 1, 0);
}

- (BOOL)isOverlay
{
  return 0;
}

@end
