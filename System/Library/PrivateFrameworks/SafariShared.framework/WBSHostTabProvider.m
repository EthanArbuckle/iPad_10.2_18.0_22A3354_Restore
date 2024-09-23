@implementation WBSHostTabProvider

- (void)setHostTab:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WBSHostTabProvider _setHostTab:](self, "_setHostTab:", v5);
  if (v5)
  {
    +[WBSHostTabProviderManager sharedManager](WBSHostTabProviderManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerHostTab:", v5);

  }
}

- (void)_setHostTab:(id)a3
{
  WBSHostableTab *v5;
  WBSHostableTab *hostTab;
  WBSHostableTab *v7;
  WBSHostableTab *v8;

  v5 = (WBSHostableTab *)a3;
  hostTab = self->_hostTab;
  if (hostTab != v5)
  {
    v8 = v5;
    v7 = hostTab;
    objc_storeStrong((id *)&self->_hostTab, a3);
    if (v7)
      -[WBSHostableTab setHostTabProvider:](v7, "setHostTabProvider:", self);
    if (v8)
      -[WBSHostableTab setHostTabProvider:](v8, "setHostTabProvider:", 0);

    v5 = v8;
  }

}

- (WBSHostableTab)hostTab
{
  return self->_hostTab;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostTab, 0);
}

@end
