@implementation PKExtensionProvider(PKUIAdditions)

- (void)_beginRemoteViewControllerExtensionServiceWithExtension:()PKUIAdditions inputItems:completion:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "extension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __116__PKExtensionProvider_PKUIAdditions___beginRemoteViewControllerExtensionServiceWithExtension_inputItems_completion___block_invoke;
    v11[3] = &unk_1E3E68260;
    v12 = v8;
    objc_msgSend(v9, "instantiateViewControllerWithInputItems:connectionHandler:", v7, v11);

  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], -1001, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v10);

  }
}

@end
