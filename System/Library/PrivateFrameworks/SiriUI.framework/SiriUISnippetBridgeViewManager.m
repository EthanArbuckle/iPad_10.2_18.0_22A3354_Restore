@implementation SiriUISnippetBridgeViewManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  return (id)sharedInstance_sharedInstance;
}

void __48__SiriUISnippetBridgeViewManager_sharedInstance__block_invoke()
{
  SiriUISnippetBridgeViewManager *v0;
  void *v1;

  v0 = objc_alloc_init(SiriUISnippetBridgeViewManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)insertBridgeViewIfNecessaryForCell:(id)a3 controller:(id)a4 currentSnippet:(id)a5 previousSnippet:(id)a6 bridgeSize:(CGSize)a7
{
  double height;
  double width;
  id v12;
  id v13;
  id v14;
  SiriUISnippetBridgeView *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  id v21;

  height = a7.height;
  width = a7.width;
  v21 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if ((SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = -[SiriUISnippetBridgeView initWithFrame:]([SiriUISnippetBridgeView alloc], "initWithFrame:", 0.0, -height, width, height);
        objc_msgSend(MEMORY[0x24BDF6950], "siriui_snippetBackgroundColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriUISnippetBridgeView setBackgroundColor:](v15, "setBackgroundColor:", v16);

        +[SiriUIKeyline keylineWithKeylineType:](SiriUIKeyline, "keylineWithKeylineType:", 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "scale");
        objc_msgSend(v17, "setFrame:", 0.0, 0.0, width, 1.0 / v19);

        -[SiriUISnippetBridgeView addSubview:](v15, "addSubview:", v17);
        objc_msgSend(v21, "contentView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addSubview:", v15);
        objc_msgSend(v21, "setShowBackgroundView:", 0);
        objc_msgSend(v12, "setManageBackgroundColor:", 1);

      }
    }
  }

}

- (void)removeBridgeViewsFromView:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "removeFromSuperview");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

@end
