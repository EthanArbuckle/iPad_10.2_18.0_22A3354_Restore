@implementation UIScene(PreviewsOSSupportAdditions)

- (void)uv_registerActionHandlerForKey:()PreviewsOSSupportAdditions handler:
{
  id v6;
  id v7;
  _UVBSActionHandler *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = -[_UVBSActionHandler initWithHandler:]([_UVBSActionHandler alloc], "initWithHandler:", v6);

  v10[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_registerBSActionResponderArray:forKey:", v9, v7);

}

- (void)uv_sendSceneAction:()PreviewsOSSupportAdditions
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "_FBSScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sendActions:", v5);
}

- (uint64_t)uv_previewAgentDisplaysUI
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_FBSScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "specification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "previewAgentDisplaysUI");
  else
    v3 = 0;

  return v3;
}

@end
