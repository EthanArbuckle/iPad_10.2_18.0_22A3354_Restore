@implementation PKExtension(PKUIAdditions)

- (void)beginRemoteViewControllerExtensionServiceWithInputItems:()PKUIAdditions completion:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__PKExtension_PKUIAdditions__beginRemoteViewControllerExtensionServiceWithInputItems_completion___block_invoke;
  v10[3] = &unk_1E3E74070;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "_beginRemoteViewControllerExtensionServiceWithExtension:inputItems:completion:", a1, v7, v10);

}

@end
