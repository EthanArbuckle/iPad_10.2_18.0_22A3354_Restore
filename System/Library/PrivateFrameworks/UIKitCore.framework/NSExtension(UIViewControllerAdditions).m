@implementation NSExtension(UIViewControllerAdditions)

- (uint64_t)instantiateViewControllerWithInputItems:()UIViewControllerAdditions listenerEndpoint:connectionHandler:
{
  return objc_msgSend(a1, "_instantiateViewControllerWithInputItems:asAccessory:traitCollection:listenerEndpoint:connectionHandler:", a3, 0, 0, a4, a5);
}

- (void)_instantiateViewControllerWithInputItems:()UIViewControllerAdditions asAccessory:traitCollection:listenerEndpoint:connectionHandler:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD aBlock[5];
  id v21;
  id v22;
  uint64_t v23;
  char v24;

  v13 = a5;
  v14 = a7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke;
  aBlock[3] = &unk_1E16C4F50;
  v24 = a4;
  aBlock[4] = a1;
  v21 = v13;
  v22 = v14;
  v23 = a2;
  v15 = v14;
  v16 = v13;
  v17 = a6;
  v18 = a3;
  v19 = _Block_copy(aBlock);
  objc_msgSend(a1, "beginExtensionRequestWithOptions:inputItems:listenerEndpoint:completion:", 2, v18, v17, v19);

}

- (uint64_t)instantiateViewControllerWithInputItems:()UIViewControllerAdditions connectionHandler:
{
  return objc_msgSend(a1, "instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:", a3, 0, a4);
}

- (uint64_t)_instantiateAccessoryViewControllerWithInputItems:()UIViewControllerAdditions connectionHandler:
{
  return objc_msgSend(a1, "_instantiateViewControllerWithInputItems:asAccessory:traitCollection:listenerEndpoint:connectionHandler:", a3, 1, 0, 0, a4);
}

- (uint64_t)instantiateViewControllerWithInputItems:()UIViewControllerAdditions traitCollection:connectionHandler:
{
  return objc_msgSend(a1, "_instantiateViewControllerWithInputItems:asAccessory:traitCollection:listenerEndpoint:connectionHandler:", a3, 0, a4, 0, a5);
}

- (id)__UIKit_upcall_icons
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_getAssociatedObject(a1, &kNSExtensionIconsKey);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = (void *)MEMORY[0x1E0CA58F0];
    objc_msgSend(a1, "_plugIn");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("uuid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pluginKitProxyForUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "containingBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scale");
      +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        objc_msgSend(v2, "addObject:", v11);

    }
    objc_setAssociatedObject(a1, &kNSExtensionIconsKey, v2, (void *)1);

  }
  return v2;
}

@end
